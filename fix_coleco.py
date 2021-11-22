#!/usr/bin/env python3
# Nov 21, 2021
# fix_coleco.py

# ********************************************************************
# take unformatted and poorly OCR'd text file
# and format and correct file
#
# generates two files
# new_<filename>.txt - corrected file
# <filename>.asm     - file which could be sent to z-80 assembler
# ********************************************************************

import os


always_count_error = False

error_none       = 0
error_linenumber = 1
error_address    = 2
error_instr      = 4
error_instr_data = 8
error_bad_hex    = 16
error_odd_length = 32
error_too_large  = 64
error_mnemonic   = 128
    
errors_to_display = error_mnemonic # 1+2+4+8+16+32+64+128


def find_linenumber(text, line):
    """
        Find the column of the specified linenumber
        text - string to search
        line - line number to find
        
        returns position the line number was found
    """
    return text.find(" " + str(line))

def get_address(text):
    """
        Find the column of the containing the calculated
        value of address of an equate.
        Address will be enclosed by < and >
        
        text - string to search
        
        returns:
            ""    1) the address wasn't found,
                  2) address was missing < or >
            "hex" the hex string of the address
        NOTE:  doesn't check for valid length    
    """
    address = ""
    start = text.find("<")
    if start >= 0:
        start += 1
        end    = text.find(">")
        if end >= 0:
            address = text[start:end]
    
    return address

def find_instruction_address(text):
    """
        Find the column of the containing the location
        of the assembled instructions
        
        text - string to search
        
        returns "" if the address wasn't found, or the hex string of the address
        NOTE:  doesn't check for valid length 
    """
    if text.strip() == "":
        return -1
    else:
        return text.find(text.strip()[0])

def correct_hex_ocr(hex):
    """
        fixes common problem with hexidecimal representations
        
        hex - hexidecimal string to check
        returns:
            hex string after character substitutions if required.
    """
    
    while True:
        s = hex.find("O")
        if s >= 0:
            hex = hex[:s] + "0" + hex[s+1:]
        else:
            s = hex.find("S")
            if s >= 0:
                hex = hex[:s] + "5" + hex[s+1:]
            else:
                s = hex.find("G")
                if s >= 0:
                    hex = hex[:s] + "6" + hex[s+1:]
                else:
                    s = hex.find("§")
                    if s >= 0:
                        hex = hex[:s] + "5" + hex[s+1:]
                    else:
                        s = hex.find("£")
                        if s >= 0:
                            hex = hex[:s] + "E" + hex[s+1:]
                        else:
                            s = hex.find("€")
                            if s >= 0:
                                hex = hex[:s] + "E" + hex[s+1:]
                            else:
                                break
        
    return hex

def validate_hex(hex):
    
    ok = True
    for x in hex:
        if not x in ['0','1','2','3','4','5','6','7','8','9','A','B','C','D','E','F']:
            ok = False
            break
    return ok

def get_instruction_address(text, position):
    """
        Extract address,
        Converts hex string to uppercase
        Correct OCR
        Validate hex
        
        return tuple (hex, error)
    """
    
    address = text[position:  text[position:].find(" ") + position]
    address = address.upper()
    if len(address) > 0:
        if address[0] == '—':
            address = address[1:]
        
    address = correct_hex_ocr(address)
    
    error = ""
    error_type = error_none
    


    if not validate_hex(address):
        error = f"ADDRESS: {address} BAD HEX"
        error_type = error_bad_hex
        
    if len(address) % 2 != 0:
        error = f"ADDRESS: {address} ODD LENGTH"
        error_type = error_odd_length
        
    if len(address) > 4:
        error = f"ADDRESS: {address} BAD LENGTH"
        error_type = error_too_large

    return (address, error, error_type)

def find_instructions(text, instr_address_column):
    if text.strip() == "":
        return -1
    else:
        # find the next space
        space = text.strip().find(" ")
        if space > 0:
            text2 = text[space:].strip()
            return text.find(text2[0])
        else:
            return -1

def fix_ocr_instruction_mistakes(text):
    text = text.upper()
    text = text.replace("LO", "LD")
    text = text.replace("LD.", "LD")
    text = text.replace("TD", "LD")
    text = text.replace("ID", "LD")
    text = text.replace("I)", "LD")
    text = text.replace("SP", "JP")
    text = text.replace("UP", "JP")
    text = text.replace("UR", "JR")
    text = text.replace("OEFB", "DEFB")
    text = text.replace("£QU", "EQU")
    text = text.replace("ADO", "ADD")
    text = text.replace("AOD", "ADD")
    text = text.replace("ANO", "AND")
    text = text.replace("AOC", "ADC")
    text = text.replace("DUNZ", "DJNZ")
    return text

def display_error(text, error, linenumber, display_line, error_type):
    
    if always_count_error:
        count_error = 1
    else:
        count_error = 0
        
    if (errors_to_display & error_type) != 0:
        count_error = 1
        if display_line:
            print(line)
        print(f"[{linenumber}] {error}")
    
    return count_error

def get_instructions(text):
    text = text.strip()
    instructions = text[text.find(" "):]
    instructions = instructions.strip()
    instructions = instructions.upper()
    
    instructions = correct_hex_ocr(instructions)
    
    error = ""
    error_type = error_none
    
    if not validate_hex(instructions):
        error = f"INSTRUCTIONS: {instructions} - BAD HEX CHARACTER"
        error_type = error_bad_hex
        
    if len(instructions) % 2 != 0:
        error = f"INSTRUCTIONS: {instructions} ODD NUMBER OF DIGITS"
        error_type = error_odd_length

    if len(instructions) > 8:
        error = f"INSTRUCTIONS: {instructions} BAD LENGTH"
        error_type = error_too_large

    return (instructions, error, error_type)

def first_non_space_column(text):
    if text.strip() == "":
        return -1
    else:
        return text.find(text.strip()[0])

def fix_ocr_argument_mistakes(text):
    text = text.replace('(', '[')
    text = text.replace('{', '[')
    text = text.replace(')', ']')
    text = text.replace('}', ']')
    text = text.replace('.', ',')
    
    while text.find('[[') >= 0:
        text = text.replace('[[','[')
        
    while text.find(']]') >=0:
        text = text.replace(']]',']')
        
    while text.find(' ,') >=0:
        text = text.replace(' ,', ',')

    while text.find(', ') >=0:
        text = text.replace(', ', ',')
        
    if text == 'LY':
        text = "IY"
        
    return text
    
def coleco_formatter(filename):
    error_count = 0
    
    display_line = False
    max_linenumber_size = 5
    max_errors = 100
    linenumber = 0
    
    allowed_spaces_before_column_1 = 7
    
    new_address_column = 20
    new_instr_address_column = 7 
    new_line_column = 25
    
    label_width = 20
    instr_width = 5
    arg_width   = 30
    
    
    stop_at_line = 4000000
    
    valid_instructions = ["EQU", "JP", "DEFL", "DEF", "DEFB", "DEFS", "ORG", "IF", "ELSE", "END",
                          "RET", "RETN", "NOP", "PUSH", "POP", "EX", "CALL", "LD", "INC", "OR",
                          "JR", "OUTI", "DEC", "INI", "OUT", "IN", "ADD", "BIT", "CP", "SRL",
                          "RR", "AND", "SRA", "DJNZ", "XOR", "EI", "RES", "RRCA", "RRD", "SUB",
                          "RLD", "RLCA", "LDDR", "ADC", "RLC", "DJNZ", "SCF", "CCF", "LDIR",
                          "SBC", "SET"]
    
    for _ in range(50):
        print()
        
    f = open(filename, "r")
    
    directory = os.path.dirname(filename)
    basefile = os.path.basename(filename)
    
    new_filename = directory + "/" + "new_"+basefile;
    
    asm_filename = directory + "/" + basefile[:basefile.find('.')] + ".asm"
    print(asm_filename)
    o = open(new_filename, "w")
    a = open(asm_filename, "w")
    
    text_line = " "
    while text_line != "":
        text_line = f.readline()
        if text_line == "":
            print("End of file")
            break
        
        text_line = text_line.rstrip()
        text_line = text_line.replace("\t", "    ")
        text_line = text_line.replace("|", "")
        linenumber += 1
        
        
        if linenumber == stop_at_line:
            print("stopping processing")
            break
        
        column = find_linenumber(text_line, linenumber)
        if column < 0:
            display_error(text_line, f"Did not find expected line number {linenumber}", linenumber, display_line, error_linenumber)
            error_count += 1
            
        original_pre_linenumber = text_line[:column]
        original_post_linenumber = text_line[column+len(str(linenumber))+1:]
        address = get_address(original_pre_linenumber)
        instr_address = ""
        instr_data = ""
        
        #    FC30 C3F832   
        new_preline = ""
        if address != "":
            address = "<" + address + ">"
        else:
            instr_address_column = find_instruction_address(original_pre_linenumber)
            if instr_address_column > 0:
                (instr_address, error, error_type) = get_instruction_address(original_pre_linenumber, instr_address_column)
                if error != "":
                    error_count += display_error(text_line, error, linenumber, display_line, error_type)

                    
                    
                instr_data_column = find_instructions(original_pre_linenumber, instr_address_column)
                if instr_data_column > 0:               
                    (instr_data, error, error_type) = get_instructions(original_pre_linenumber)
                    if error != "":
                        error_count += display_error(text_line, error, linenumber, display_line, error_type)
                        
        
        if error_count >= max_errors:
            print("error count exceeded")
            break

        if address != "":
            new_preline = address.rjust(new_address_column)
        else:    
            new_preline = instr_address.rjust(new_instr_address_column) + "  " + instr_data

        new_preline = new_preline.ljust(new_line_column)

        formatted_linenumber = str(linenumber).ljust(max_linenumber_size)+ " "
        
        
        # formatting post linenumber
        
        # find first non-space
        line = original_post_linenumber
        
        column = first_non_space_column(line)
        if column < allowed_spaces_before_column_1:
            # probably a label or first column comment
            line = line.lstrip()
        
        if linenumber >= 273:
            label = ""
        
        label_found = False
        label = ""
        
        instruction_found = False
        instruction = ""
        
        argument_found = False
        argument = ""
        
        ending_comment_found = False
        ending_comment = ""
        
        special = line.find('^') >= 0
        special = special or (line.find(';') == 0)
        
        # if it's a comment, don't do anymore processing
        if len(line) > 0:
                     
            if special:
                new_post_linenumber = line
            else:
                
                # 'LABEL INSTRUCTION ARGUMENT ; COMMENT'                
                # find the comment and save it, remove it from line
                
                column = line.find(';')
                if column >= 0:
                    ending_comment = line[column:]
                    line = line[:column]


                # 'LABEL INSTRUCTION ARGUMENT '
                # look for the label if present
                column = first_non_space_column(line)
                if column == 0:
                    label_found = True
                    end_of_label = line.find(' ')
                    if end_of_label < 0:
                        label = line.strip()
                        line = ''
                    else:
                        label = line[:end_of_label].upper()
                        line = line[end_of_label:]

                # ' INSTRUCTION ARGUMENT '
                # look for the instruction                
                instruction_found = False
                # first first space (may or may not have label)
                instruction_column = first_non_space_column(line)
                if instruction_column >= 0:
                    
                    instruction = line[instruction_column:]
                    instruction = instruction.lstrip()
                    if len(instruction) > 0:
                        
                        instruction_found = True
                        end_of_instruct = instruction.find(' ')
                        if end_of_instruct >= 0:
                            instruction = instruction[:end_of_instruct].upper()
                            instruction = fix_ocr_instruction_mistakes(instruction)
                            if not instruction in valid_instructions:
                                error = f"Unrecognized mnemonic '{instruction}'"

                                error_type = error_mnemonic
                                error_count += display_error(text_line, error, linenumber, display_line, error_type)

                            line = line[instruction_column+len(instruction):]
                        else:
                            line = ''
                        
                        # ' ARGUMENT '
                        
                        argument_column = first_non_space_column(line)
                        if argument_column >= 0:
                            argument = line[argument_column:]
                            argument = argument.lstrip()
                            if len(argument) > 0:
                                argument_found = True
                                argument = argument.upper()
                                argument = argument.strip()
                                argument = fix_ocr_argument_mistakes(argument)
                
                # spaces added to insure columns don't run together        
                new_post_linenumber = label.ljust(label_width) + " " + instruction.ljust(instr_width) \
                                       + " " + argument.ljust(arg_width) + " " + ending_comment
        else:
            new_post_linenumber = ""
            
        newline = new_preline + formatted_linenumber + new_post_linenumber    
        
        o.write(newline + "\n")
        a.write(new_post_linenumber + "\n")
    
    print(f"{error_count} corrections required")
    print("Completed")
    o.close()
    a.close()
    f.close()  
    
def main():
    directory = "/home/ndavie/Documents/Projects/Coleco-Adam-Source/"
    filename = "coleco-listing.txt"
    coleco_formatter(directory+filename)
    
main()