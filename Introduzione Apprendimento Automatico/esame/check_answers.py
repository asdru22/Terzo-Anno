import json
import matplotlib.pyplot as plt

# File di input e output
input_file = "progress.json"
output_file = "error_percentages.json"

def calculate_error_percentages(input_file, output_file):
    # Leggi il file JSON
    with open(input_file, 'r', encoding='utf-8') as file:
        progress = json.load(file)
    
    # Calcola la percentuale di errori per ogni domanda
    error_data = []
    mistakes_data = []
    for question_number, data in progress.items():
        total_attempts = data["correct_count"] + data["wrong_count"]
        if total_attempts > 0:
            error_percentage = (data["wrong_count"] / total_attempts) * 100
        else:
            error_percentage = 0  # Se non ci sono tentativi
        error_data.append({
            "question_number": int(question_number),
            "error_percentage": error_percentage
        })
        mistakes_data.append((int(question_number), data["wrong_count"]))
    
    # Ordina i dati in ordine decrescente di percentuale di errori
    error_data.sort(key=lambda x: x["error_percentage"], reverse=True)
    mistakes_data.sort(key=lambda x: x[1], reverse=True)

    # Salva i dati nel file di output
    with open(output_file, 'w', encoding='utf-8') as file:
        json.dump(error_data, file, indent=4, ensure_ascii=False)
    
    print(f"File '{output_file}' creato con successo.")
    
    # Mostra il grafico degli errori
    plot_mistakes_graph(mistakes_data)

def plot_mistakes_graph(mistakes_data):
    # Estrai i dati per il grafico
    question_numbers = [x[0] for x in mistakes_data]
    mistakes = [x[1] for x in mistakes_data]
    
    # Crea il grafico a barre
    plt.figure(figsize=(10, 6))
    plt.bar(question_numbers, mistakes, color="salmon", edgecolor="black")
    
    # Aggiungi etichette e titolo
    plt.xlabel("Numero della domanda", fontsize=14)
    plt.ylabel("Numero di errori", fontsize=14)
    plt.title("Numero di errori per domanda", fontsize=16)
    plt.xticks(question_numbers)
    
    # Mostra il grafico
    plt.tight_layout()
    plt.show()

# Esegui la funzione
calculate_error_percentages(input_file, output_file)
