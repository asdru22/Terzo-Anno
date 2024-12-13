import json
import random
import os
import tkinter as tk
from tkinter import messagebox

difficile = True

PROGRESS_FILE = "progress.json"

def load_questions(json_file):
    with open(json_file, 'r', encoding='utf-8') as file:
        return json.load(file)

def save_progress(progress):
    with open(PROGRESS_FILE, 'w', encoding='utf-8') as file:
        json.dump(progress, file, indent=4, ensure_ascii=False)

def load_progress(questions):
    progress = {}
    if os.path.exists(PROGRESS_FILE):
        with open(PROGRESS_FILE, 'r', encoding='utf-8') as file:
            progress = json.load(file)
            
        # Check if all questions are marked as answered
        all_answered = all(
            str(question["number"]) in progress and progress[str(question["number"])].get("answered", False)
            for question in questions
        )
        if all_answered:
            # Reset all answered flags to false
            for question in questions:
                question_number = str(question["number"])
                if question_number in progress:
                    progress[question_number]["answered"] = False
                else:
                    # Initialize progress for questions not yet in the file
                    progress[question_number] = {"correct_count": 0, "wrong_count": 0, "answered": False}
            progress["answered_current_quiz"] = 0
    else:
        # Initialize progress for all questions if file doesn't exist
        for question in questions:
            question_number = str(question["number"])
            progress[question_number] = {"correct_count": 0, "wrong_count": 0, "answered": False}
        progress["answered_current_quiz"] = 0

    # Save updated progress to file
    save_progress(progress)
    return progress

class QuizApp:
    def __init__(self, root, questions):
        self.root = root
        self.root.title("Quiz")
        self.questions = questions
        self.total_questions = len(questions)
        self.progress = load_progress(questions)
        self.current_question_index = 0
        self.current_options = []
        self.correct_answers = 0

        # Selezione modalità
        if self.progress:
            self.resume_quiz()
        else:
            self.start_new_quiz()

        # Interfaccia grafica
        self.question_label = tk.Label(self.root, text="", wraplength=600, justify="center", font=("Arial", 14))
        self.question_label.pack(pady=20)

        self.options_frame = tk.Frame(self.root)
        self.options_frame.pack(pady=20)

        self.category_label = tk.Label(self.root, text="", font=("Arial", 10, "italic"))
        self.category_label.pack(pady=5)

        # Progress text
        self.progress_label = tk.Label(self.root, text="", font=("Arial", 10))
        self.progress_label.pack(pady=10)

        self.update_progress_label()
        self.display_question()

    def resume_quiz(self):
        unanswered = [q for q in self.questions if str(q["number"]) not in self.progress or not self.progress[str(q["number"])]["answered"]]
        if unanswered:
            random.shuffle(unanswered)
            self.questions = unanswered
        else:
            messagebox.showinfo("Quiz completato", "Hai già risposto a tutte le domande!")
            self.root.destroy()

    def start_new_quiz(self):
        for question in self.questions:
            question_number = str(question["number"])
            if question_number not in self.progress:
                self.progress[question_number] = {"correct_count": 0, "wrong_count": 0, "answered": False}
            else:
                # Reset the answered flag
                self.progress[question_number]["answered"] = False
        self.progress["answered_current_quiz"] = 0
        save_progress(self.progress)
        random.shuffle(self.questions)

    def update_progress_label(self):
        answered = self.progress.get("answered_current_quiz", 0)
        self.progress_label.config(text=f"Domande risposte: {answered}/{self.total_questions}")

    def display_question(self):
        if self.current_question_index < len(self.questions):
            question = self.questions[self.current_question_index]
            self.current_options = question["wrong"] + question["right"]
            random.shuffle(self.current_options)

            # Aggiorna UI
            if difficile:
              self.question_label.config(text=f"{question['question']}")
            else:
              self.question_label.config(text=f"{question['number']}) {question['question']}")
              self.category_label.config(text=f"Categoria: {question['category']}")

            for widget in self.options_frame.winfo_children():
                widget.destroy()

            for i, option in enumerate(self.current_options):
                btn = tk.Button(self.options_frame, text=option, font=("Arial", 12), command=lambda o=option: self.check_answer(o))
                btn.pack(fill=tk.X, padx=50, pady=5)

        else:
            self.display_summary()

    def display_summary(self):
        messagebox.showinfo("Quiz completato", f"Hai terminato il quiz! Risposte corrette: {self.correct_answers}/{len(self.questions)}")
        self.root.destroy()

    def check_answer(self, selected_option):
        question = self.questions[self.current_question_index]
        question_number = str(question["number"])

        if selected_option in question["right"]:
            messagebox.showinfo("Risultato", "Risposta corretta! 🎉")
            self.correct_answers += 1
            self.progress[question_number]["correct_count"] += 1
        else:
            correct_answer = question["right"][0]
            messagebox.showerror("Risultato", f"Risposta sbagliata. La risposta corretta era: {correct_answer}")
            self.progress[question_number]["wrong_count"] += 1

        # Mark question as answered
        self.progress[question_number]["answered"] = True
        self.progress["answered_current_quiz"] += 1
        save_progress(self.progress)
        self.update_progress_label()
        self.next_question()

    def next_question(self):
        self.current_question_index += 1
        self.display_question()

def main():
    json_file = "questions.json"
    questions = load_questions(json_file)
    root = tk.Tk()
    app = QuizApp(root, questions)
    root.mainloop()

if __name__ == "__main__":
    main()
