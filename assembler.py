import re
import os
import sys

SPECIFICATIONS_FILE_PATH = "specifications.md"

labels_generated = 0  # pylint: disable=invalid-name


class InstructionData:
    def __init__(
        self,
        binary_identifier: int,
        have_destination: bool,
        min_arguments: int,
        max_arguments: int,
    ):
        self.binary_identifier = binary_identifier
        self.have_destination = have_destination
        self.min_arguments = min_arguments
        self.max_arguments = max_arguments


def parse_range(range_str: str) -> list[int]:
    if not range_str:
        return []
    if "," in range_str:
        out: list[int] = []
        for part in range_str.split(","):
            if "-" in part:
                start, end = part.split("-")
                out.extend(range(int(start), int(end) + 1))
            else:
                out.append(int(part))
        return out
    if "-" in range_str:
        start, end = range_str.split("-")
        return list(range(int(start), int(end) + 1))
    return [int(range_str)]


def get_instructions_data(specifications: str) -> dict[str, InstructionData]:
    instructions_data: dict[str, InstructionData] = {}
    instructions_table: list[tuple[str]] = re.findall(
        r"\| Binary Identifier \|.+?$.\|.+?$.((\|.+?$.)+)",
        specifications,
        re.MULTILINE | re.DOTALL,
    )
    raw_instructions: list[str] = instructions_table[0][0].split("\n")
    for raw_instruction in raw_instructions:
        if not raw_instruction:
            continue
        raw_instruction = raw_instruction.split("|")
        raw_instruction = [x.strip().lower() for x in raw_instruction]
        instruction_name = raw_instruction[3]
        if instruction_name == "reserved":
            continue
        binary_identifier = int(raw_instruction[1], 2)
        hex_identifier = int(raw_instruction[2], 16)
        have_destination = raw_instruction[4] == "true"
        min_arguments = min(parse_range(raw_instruction[5]))
        max_arguments = max(parse_range(raw_instruction[5]))
        if binary_identifier != hex_identifier:
            raise ValueError(
                f"Binary and hex identifiers for instruction {instruction_name} do not match"
            )
        instructions_data[instruction_name] = InstructionData(
            binary_identifier, have_destination, min_arguments, max_arguments
        )
    return instructions_data


def iasm_to_asm(iasm: str) -> str:
    assembly: list[str] = []
    for line in iasm.split("\n"):
        line = line.strip()
        if not line:
            continue
        labels, instruction = line.split("|")
        if labels:
            labels = labels.strip().split(" ")
            for label in labels:
                assembly.append(f"{label}")
        instruction = instruction.strip()
        assembly.append(f"{instruction}")
    return "\n".join(assembly)


def parse_assembly(
    raw_assembly: str,
) -> tuple[list[tuple[list[str], list[str]]], dict[str, str]]:
    assembly: list[tuple[list[str], list[str]]] = [(["ldi", "$15", "8192"], [])]
    defines: dict[str, str] = {}
    unapplied_labels: list[str] = []
    for raw_assembly_line in raw_assembly.split("\n"):
        assembly_line = raw_assembly_line.strip().lower()
        if not assembly_line or assembly_line.startswith(";"):
            continue
        if assembly_line.startswith("."):
            unapplied_labels.append(assembly_line)
            continue
        if assembly_line.startswith("#define") or assembly_line.startswith("@define"):
            _, define_name, define_value = re.split(r"\s+", assembly_line, maxsplit=2)
            defines[define_name] = define_value
            continue
        instruction_data: list[str] = re.split(r"\s+", assembly_line)
        labels: list[str] = unapplied_labels.copy()
        unapplied_labels.clear()
        assembly.append((instruction_data, labels))
    return assembly, defines


def get_label_locations(assembly: list[tuple[list[str], list[str]]]) -> dict[str, int]:
    label_locations: dict[str, int] = {}
    for index, (_, labels) in enumerate(assembly):
        for label in labels:
            if label in label_locations:
                raise ValueError(f"Label {label} is already defined")
            label_locations[label] = index
    return label_locations


def parse_int(number: str) -> int:
    if number.startswith("0x"):
        return int(number, 16)
    if number.startswith("0b"):
        return int(number, 2)
    if number.startswith("0o"):
        return int(number, 8)
    return int(number)


def argument_to_int(argument: str, label_locations: dict[str, int]) -> int:
    argument = argument.lstrip("r$m#p%")
    if argument.startswith("."):
        if argument not in label_locations:
            raise ValueError(f"Label {argument} is not defined")
        return label_locations[argument]
    return parse_int(argument)


def int_to_bin(value: int, length: int) -> str:
    binary: str = bin(value)[2:]
    if len(binary) > length:
        raise ValueError(f"Value {value} is too large for {length}-bit binary")
    return binary.zfill(length)


def operation_to_bin(
    operation: list[str],
    instructions_data: dict[str, InstructionData],
    label_locations: dict[str, int],
    defines: dict[str, str],
) -> str:
    instruction_name = operation[0]
    instruction_data = instructions_data[instruction_name]
    argument_count = len(operation) - 1 - int(instruction_data.have_destination)
    if argument_count < 0:
        if instruction_data.have_destination:
            raise ValueError(
                f"Instruction {instruction_name} requires a destination register"
            )
        raise ValueError(
            f"Instruction {instruction_name} requires at least one argument"
        )
    if argument_count < instruction_data.min_arguments:
        raise ValueError(
            f"Instruction {instruction_name} expects at least {instruction_data.min_arguments} arguments"
        )
    if argument_count > instruction_data.max_arguments:
        raise ValueError(
            f"Instruction {instruction_name} expects at most {instruction_data.max_arguments} arguments"
        )
    for i in range(1, len(operation)):
        if operation[i] in defines:
            operation[i] = defines[operation[i]]
    if instruction_data.have_destination:
        destination = argument_to_int(operation[1], label_locations)
        raw_arguments = operation[2:]
    else:
        destination = 0
        raw_arguments = operation[1:]
    first_argument_reg = len(raw_arguments) > 0 and (
        raw_arguments[0].startswith("$") or raw_arguments[0].startswith("r")
    )
    second_argument_reg = len(raw_arguments) > 1 and (
        raw_arguments[1].startswith("$") or raw_arguments[1].startswith("r")
    )
    if argument_count == 0:
        arguments = 0
    elif argument_count == 1:
        arguments = argument_to_int(raw_arguments[0], label_locations)
    elif argument_count == 2:
        first_argument_int = argument_to_int(raw_arguments[0], label_locations)
        second_argument_int = argument_to_int(raw_arguments[1], label_locations)
        if first_argument_reg and second_argument_reg:
            if first_argument_int > 0xFF or second_argument_int > 0xFF:
                raise ValueError(
                    f"Argument values {first_argument_int} and {second_argument_int} are too large for 8-bit binary"
                )
            arguments = (
                (first_argument_int & 0xFF) << 8
            ) | (second_argument_int & 0xFF)
        elif first_argument_reg:
            if first_argument_int > 0xF or second_argument_int > 0xFFF:
                raise ValueError(
                    f"Argument values {first_argument_int} and {second_argument_int} are too large for 4-bit and 12-bit binary"
                )
            arguments = (
                (first_argument_int & 0xF) << 12
            ) | (second_argument_int & 0xFFF)
        elif second_argument_reg:
            if first_argument_int > 0xFFF or second_argument_int > 0xF:
                raise ValueError(
                    f"Argument values {first_argument_int} and {second_argument_int} are too large for 12-bit and 4-bit binary"
                )
            arguments = (
                (first_argument_int & 0xFFF) << 8
            ) | (second_argument_int & 0xF)
        else:
            if first_argument_int > 0xFF or second_argument_int > 0xFF:
                raise ValueError(
                    f"Argument values {first_argument_int} and {second_argument_int} are too large for 8-bit binary"
                )
            arguments = (
                (first_argument_int & 0xFF) << 8
            ) | (second_argument_int & 0xFF)
    else:
        raise ValueError(f"Invalid number of arguments: {argument_count}")
    return (
        int_to_bin(instruction_data.binary_identifier, 8)
        + int_to_bin(argument_count, 2)
        + int_to_bin(first_argument_reg, 1)
        + int_to_bin(second_argument_reg, 1)
        + int_to_bin(destination, 4)
        + int_to_bin(arguments, 16)
    )


def extract_define_word_instructions(
    assembly: list[tuple[list[str], list[str]]],
) -> list[tuple[list[str], list[str]]]:
    to_delete_indexes: list[int] = []
    define_word_instructions: list[tuple[list[str], list[str]]] = []
    for index, (operation, labels) in enumerate(assembly):
        if operation[0] == "dw":
            define_word_instructions.append((operation, labels))
            to_delete_indexes.append(index)
    for index in reversed(to_delete_indexes):
        del assembly[index]
    return define_word_instructions


def relative_to_absolute(assembly: list[tuple[list[str], list[str]]]) -> None:
    global labels_generated  # pylint: disable=global-statement
    for inst_index, (operation, _) in enumerate(assembly):
        for arg_index, arg in enumerate(operation):
            if not arg.startswith("~"):
                continue
            offset = int(arg[1] + "1") * parse_int(arg[2:])
            target = inst_index + offset
            if target < 0 or target >= len(assembly):
                raise ValueError(f"Relative jump target {target} is out of bounds")
            labels_generated += 1
            genrated_label_name = f".__generated_label_{labels_generated}_N4T7hAP4$"
            assembly[inst_index][0][arg_index] = genrated_label_name
            assembly[target][1].append(genrated_label_name)


def expand_cal_ret(assembly: list[tuple[list[str], list[str]]]) -> None:
    for inst_index, (operation, labels) in enumerate(assembly):
        if operation[0] == "cal":
            if len(operation) != 2:
                raise ValueError("cal instruction expects one argument")
            assembly[inst_index] = (["psh", "~+2"], labels)
            assembly.insert(inst_index + 1, (["brn", operation[1]], []))
        elif operation[0] == "ret":
            if len(operation) != 1:
                raise ValueError("ret instruction expects no arguments")
            assembly[inst_index] = (["pop", "$14"], labels)
            assembly.insert(inst_index + 1, (["brn", "$14"], []))


def expand_push_pop(assembly: list[tuple[list[str], list[str]]]) -> None:
    for inst_index, (operation, labels) in enumerate(assembly):
        if operation[0] == "psh":
            if len(operation) != 2:
                raise ValueError("psh instruction expects one argument")
            assembly[inst_index] = (["sub", "$15", "$15", "1"], labels)
            assembly.insert(inst_index + 1, (["ldi", "$14", operation[1]], []))
            assembly.insert(inst_index + 2, (["str", "$14", "$15"], []))
        elif operation[0] == "pop":
            if len(operation) != 2:
                raise ValueError("pop instruction expects one argument")
            assembly[inst_index] = (["lod", operation[1], "$15"], labels)
            assembly.insert(inst_index + 1, (["add", "$15", "$15", "1"], []))


def parse_define_words(
    define_word_instructions: list[tuple[list[str], list[str]]],
    label_locations: dict[str, int],
    defines: dict[str, str],
) -> list[int]:
    ram_data: list[int] = []
    for instruction, labels in define_word_instructions:
        current_index = len(ram_data)
        for label in labels:
            label_locations[label] = current_index
        for argument in instruction[1:]:
            if argument in defines:
                argument = defines[argument]
            ram_data.append(parse_int(argument))
    return ram_data


def get_absolute_path(path: str) -> str:
    return os.path.abspath(path)


def main() -> None:
    with open(SPECIFICATIONS_FILE_PATH, "r", encoding="utf-8") as specifications_file:
        specifications = specifications_file.read()
        instructions_data = get_instructions_data(specifications)
    if len(sys.argv) == 2:
        assembly_path = sys.argv[1]
    else:
        assembly_path = input("Enter the path to the assembly file: ")
        assembly_path = assembly_path.strip().strip('"')
    assembly_file_folder = os.path.dirname(assembly_path)
    assembly_file_name = os.path.basename(assembly_path)
    assembly_file_name_no_ext = os.path.splitext(assembly_file_name)[0]
    rom_path = os.path.join(
        assembly_file_folder, f"{assembly_file_name_no_ext}.rom.coe"
    )
    ram_path = os.path.join(
        assembly_file_folder, f"{assembly_file_name_no_ext}.ram.coe"
    )
    with open(assembly_path, "r", encoding="utf-8") as assembly_file:
        raw_assembly = assembly_file.read()
    if assembly_path.endswith(".iasm") or all(
        ("|" in line or line.strip() == "" for line in raw_assembly.split("\n"))
    ):
        raw_assembly = iasm_to_asm(raw_assembly)
        print("IASM assembly detected, converting to regular assembly")
        print("Converted assembly:")
        print("-" * 80)
        print(raw_assembly)
        print("-" * 80)
    assembly, defines = parse_assembly(raw_assembly)
    defines['sp'] = '$15'
    define_word_instructions = extract_define_word_instructions(assembly)
    relative_to_absolute(assembly)
    expand_cal_ret(assembly)
    relative_to_absolute(assembly)
    expand_push_pop(assembly)
    relative_to_absolute(assembly)
    for index, (operation, labels) in enumerate(assembly):
        print(f"{index}: {operation} {labels}")
    label_locations = get_label_locations(assembly)
    ram_data = parse_define_words(define_word_instructions, label_locations, defines)
    machine_code_bin: list[str] = []
    for operation, _ in assembly:
        machine_code_bin.append(
            operation_to_bin(operation, instructions_data, label_locations, defines)
        )
    with open(rom_path, "w", encoding="utf-8") as rom_file:
        rom_file.write("memory_initialization_radix=16;\n")
        rom_file.write("memory_initialization_vector=\n")
        for index, machine_code in enumerate(machine_code_bin):
            rom_file.write(hex(int(machine_code, 2))[2:].zfill(8))
            if index < len(machine_code_bin) - 1:
                rom_file.write(",\n")
            else:
                rom_file.write(";\n")
    with open(ram_path, "w", encoding="utf-8") as ram_file:
        ram_file.write("memory_initialization_radix=16;\n")
        ram_file.write("memory_initialization_vector=\n")
        for index, data in enumerate(ram_data):
            ram_file.write(hex(data)[2:].zfill(8))
            if index < len(ram_data) - 1:
                ram_file.write(",\n")
            else:
                ram_file.write(";\n")
    print(f"Machine code ROM exported to {get_absolute_path(rom_path)}")
    print(f"RAM data exported to {get_absolute_path(ram_path)}")


if __name__ == "__main__":
    main()
