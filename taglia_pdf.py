import PyPDF2

def split_pdf_multiple_sections(input_pdf, page_ranges, output_prefix):
    # Apri il file PDF in modalità lettura binaria
    with open(input_pdf, 'rb') as pdf_file:
        # Crea un lettore PDF
        reader = PyPDF2.PdfReader(pdf_file)
        
        for i, (start_page, end_page) in enumerate(page_ranges):
            # Crea un writer per ogni sezione
            writer = PyPDF2.PdfWriter()

            # Aggiungi le pagine specificate al nuovo file
            for page_num in range(start_page - 1, end_page):
                writer.add_page(reader.pages[page_num])

            # Definisci il nome dell'output per ogni intervallo
            output_pdf = f"{output_prefix}_{i + 1}.pdf"
            
            # Scrivi il nuovo file PDF
            with open(output_pdf, 'wb') as output_file:
                writer.write(output_file)

            print(f"Sezione {i + 1}: Pagine {start_page} a {end_page} salvata in '{output_pdf}'.")

# Esempio di utilizzo
input_pdf = "Strategia Organizzazione e Mercati/riassunto.pdf"  # Inserisci il nome del file PDF originale
page_ranges = [(2, 61),]  # Array di coppie (start_page, end_page)
output_prefix = "Strategia Organizzazione e Mercati/riassunto"  # Prefisso per i file PDF risultanti

split_pdf_multiple_sections(input_pdf, page_ranges, output_prefix)
