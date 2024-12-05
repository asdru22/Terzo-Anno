import json
import random
import os

PROGRESS_FILE = "progress.json"

def load_questions(json_file):
    with open(json_file, 'r', encoding='utf-8') as file:
        return json.load(file)

def save_progress(progress):
    with open(PROGRESS_FILE, 'w', encoding='utf-8') as file:
        json.dump(progress, file, indent=4, ensure_ascii=False)

def load_progress():
    if os.path.exists(PROGRESS_FILE):
        with open(PROGRESS_FILE, 'r', encoding='utf-8') as file:
            return json.load(file)
    return {}

def run_quiz(questions, progress, resume):
    if resume:
        answered = set(progress.keys())
        questions = [q for q in questions if str(q["number"]) not in answered]
    else:
        progress.clear()
    
    random.shuffle(questions)  # Mescola le domande

    for question in questions:
        question_text = question["question"]
        options = question["wrong"] + question["right"]
        random.shuffle(options)  # Mescola le risposte
        
        print(f"\nDomanda {question['number']} ({question['category']}):\n")
        print(question_text)
        
        # Stampa le opzioni in ordine casuale con numeri da 1 a 4
        for i, option in enumerate(options, start=1):
            print(f"{i}. {option}")
        
        # Ottieni la risposta dell'utente
        while True:
            try:
                answer = int(input("\nInserisci il numero della risposta corretta (1-4): "))
                if 1 <= answer <= len(options):
                    break
                else:
                    print("Per favore, inserisci un numero valido tra 1 e 4.")
            except ValueError:
                print("Per favore, inserisci un numero valido.")
        
        # Controlla se la risposta è corretta
        selected_option = options[answer - 1]
        if selected_option in question["right"]:
            print("Risposta corretta! 🎉")
            progress[str(question["number"])] = {"correct": True}
        else:
            print(f"Risposta sbagliata. La risposta corretta era: {question['right'][0]}")
            progress[str(question["number"])] = {"correct": False}

        # Salva i progressi
        save_progress(progress)

    print("\nQuiz terminato! Grazie per aver partecipato.")

def main():
    json_file = "questions.json"  # Sostituisci con il nome del file JSON
    questions = load_questions(json_file)
    progress = load_progress()
    
    # Chiedi se riprendere o ricominciare
    if progress:
        print("Hai già iniziato questo quiz.")
        choice = input("Vuoi riprendere da dove hai lasciato? (s/n): ").strip().lower()
        resume = choice == 's'
    else:
        resume = False

    run_quiz(questions, progress, resume)

if __name__ == "__main__":
    main()
