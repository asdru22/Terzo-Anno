import json
import random
import os
import tkinter as tk
from tkinter import messagebox

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

class QuizApp:
    def __init__(self, root, questions):
        self.root = root
        self.root.title("Quiz")
        self.questions = questions
        self.progress = load_progress()
        self.current_question_index = 0
        self.current_options = []
        
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

        self.next_button = tk.Button(self.root, text="Prossima", command=self.next_question, state=tk.DISABLED)
        self.next_button.pack(pady=20)

        self.display_question()

    def resume_quiz(self):
        unanswered = [q for q in self.questions if str(q["number"]) not in self.progress]
        if unanswered:
            random.shuffle(unanswered)  # Shuffle the remaining questions here
            self.questions = unanswered
        else:
            messagebox.showinfo("Quiz completato", "Hai già risposto a tutte le domande!")
            self.root.destroy()
            if os.path.exists(PROGRESS_FILE):
              os.remove(PROGRESS_FILE)

    def start_new_quiz(self):
        self.progress.clear()
        save_progress(self.progress)
        random.shuffle(self.questions)

    def display_question(self):
        if self.current_question_index < len(self.questions):
            question = self.questions[self.current_question_index]
            self.current_options = question["wrong"] + question["right"]
            random.shuffle(self.current_options)
            
            # Aggiorna UI
            self.question_label.config(text=f"{question["number"]}) {question["question"]}")
            self.category_label.config(text=f"Categoria: {question['category']}")
            self.next_button.config(state=tk.DISABLED)
            
            for widget in self.options_frame.winfo_children():
                widget.destroy()

            for i, option in enumerate(self.current_options):
                btn = tk.Button(self.options_frame, text=option, font=("Arial", 12), command=lambda o=option: self.check_answer(o))
                btn.pack(fill=tk.X, padx=50, pady=5)

        else:
            messagebox.showinfo("Quiz completato", "Hai terminato il quiz!")
            self.root.destroy()
            if os.path.exists(PROGRESS_FILE):
              os.remove(PROGRESS_FILE)

    def check_answer(self, selected_option):
        question = self.questions[self.current_question_index]
        if selected_option in question["right"]:
            messagebox.showinfo("Risultato", "Risposta corretta! 🎉")
            self.progress[str(question["number"])] = {"correct": True}
        else:
            correct_answer = question["right"][0]
            messagebox.showerror("Risultato", f"Risposta sbagliata. La risposta corretta era: {correct_answer}")
            self.progress[str(question["number"])] = {"correct": False}
        
        save_progress(self.progress)
        self.next_button.config(state=tk.NORMAL)

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
