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
    for question_number, data in progress.items():
        if question_number != "answered_current_quiz":
            total_attempts = data["correct_count"] + data["wrong_count"]
            if total_attempts > 0:
                error_percentage = (data["wrong_count"] / total_attempts) * 100
            else:
                error_percentage = 0  # Se non ci sono tentativi
            error_data.append({
                "question_number": int(question_number),
                "error_percentage": error_percentage
            })
    
    # Ordina i dati in ordine decrescente di percentuale di errori
    error_data.sort(key=lambda x: x["error_percentage"], reverse=True)

    # Salva i dati nel file di output
    with open(output_file, 'w', encoding='utf-8') as file:
        json.dump(error_data, file, indent=4, ensure_ascii=False)
    
    print(f"File '{output_file}' creato con successo.")
    
    # Mostra il grafico degli errori
    plot_error_percentages_graph(error_data)

def plot_error_percentages_graph(error_data):
    # Filtra i dati per includere solo errori maggiori di 0%
    filtered_data = [x for x in error_data]
    
    if not filtered_data:
        print("Non ci sono percentuali di errore da visualizzare.")
        return

    # Estrai i dati filtrati per il grafico
    question_numbers = [x["question_number"] for x in filtered_data]
    error_percentages = [100-x["error_percentage"] for x in filtered_data]
    
    # Crea il grafico a barre
    plt.figure(figsize=(12, 6))
    plt.bar(question_numbers, error_percentages, color="lightblue", edgecolor="black")
    
    # Aggiungi etichette e titolo
    plt.xlabel("Numero della domanda", fontsize=14)
    plt.ylabel("Percentuale giuste", fontsize=14)
    plt.title("Percentuale domande giuste", fontsize=16)

    # Personalizza l'asse x per spaziatura e leggibilità
    plt.xticks(question_numbers, rotation=0, ha="center", fontsize=6)
    
    # Migliora il layout complessivo
    plt.tight_layout()
    
    # Mostra il grafico
    plt.show()

# Esegui la funzione
calculate_error_percentages(input_file, output_file)