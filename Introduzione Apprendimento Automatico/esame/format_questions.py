import re
import json

def parse_markdown_to_json(md_file, json_file):
    try:
        with open(md_file, 'r', encoding='utf-8') as file:
            lines = file.readlines()
        
        questions = []
        question = None
        right_answers = []
        wrong_answers = []
        number = 0
        category = None

        for line in lines:
            line = line.strip()
            if line.startswith('#'):  # Linea che definisce una categoria
                category = line[1:].strip()
            elif re.match(r'^\d+\.\s', line):  # Identifica una nuova domanda
                # Se c'è una domanda in corso, aggiungila all'elenco
                if question:
                    questions.append({
                        "number": number,
                        "question": question,
                        "right": right_answers,
                        "wrong": wrong_answers,
                        "category": category
                    })
                # Inizia una nuova domanda
                number += 1
                question = re.sub(r'^\d+\.\s', '', line).strip()  # Rimuovi il numero e il punto
                right_answers = []
                wrong_answers = []
            elif line.startswith('+'):  # Risposte corrette
                right_answers.append(line[1:].strip())
            elif line.startswith('-'):  # Risposte errate
                wrong_answers.append(line[1:].strip())
        
        # Aggiungi l'ultima domanda se esiste
        if question:
            questions.append({
                "number": number,
                "question": question,
                "right": right_answers,
                "wrong": wrong_answers,
                "category": category
            })

        # Scrivi i dati nel file JSON
        with open(json_file, 'w', encoding='utf-8') as json_out:
            json.dump(questions, json_out, indent=4, ensure_ascii=False)
        
        print(f"Conversione completata. Dati salvati in {json_file}")
    
    except FileNotFoundError:
        print(f"Errore: il file {md_file} non è stato trovato.")
    except Exception as e:
        print(f"Si è verificato un errore: {e}")

# Esempio di utilizzo
md_file = "domande.md"  # Sostituisci con il percorso del tuo file .md
json_file = "questions.json"  # File JSON di output
parse_markdown_to_json(md_file, json_file)
