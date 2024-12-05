import re

def check_lines_starting_with_letters(file_path):
    try:
        with open(file_path, 'r') as file:
            lines = file.readlines()
        
        for line_number, line in enumerate(lines, start=1):
            if re.match(r'^[a-zA-Z]', line):
                print(f"Line {line_number} starts with a letter: {line.strip()}")
    except FileNotFoundError:
        print(f"Error: File not found: {file_path}")
    except Exception as e:
        print(f"An error occurred: {e}")

# Example usage
file_path = "Domande.md"  # Replace with the path to your file
check_lines_starting_with_letters(file_path)
