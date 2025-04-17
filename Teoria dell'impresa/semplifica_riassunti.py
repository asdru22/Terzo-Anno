def clean_text(text):
    # Remove hyphen + newline (used to split words across lines)
    text = text.replace('-\n', '')
    # Replace remaining newlines with spaces
    text = text.replace('\n', ' ')
    # Remove multiple spaces
    text = ' '.join(text.split())
    return text

# Read from in.txt
with open('Teoria dell\'impresa/in.txt', 'r', encoding='utf-8') as file:
    input_text = file.read()

# Clean the text
output = clean_text(input_text)


with open('Teoria dell\'impresa/out.txt', 'w', encoding='utf-8') as file:
    file.write(output)