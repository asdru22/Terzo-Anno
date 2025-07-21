import csv

def csv_to_sql_values(csv_path):
    with open(csv_path, newline='', encoding='utf-8') as csvfile:
        reader = csv.DictReader(csvfile)
        for row in reader:
            number = 'NULL' if row['Number'].strip() == '' else row['Number']
            tradeable = 'TRUE' if row['Tradeable'].strip().lower() == 'yes' else 'FALSE'

            values = [
                row['Type'],
                row['Category'],
                row['Place of origin'],
                row['Brand'],
                row['Fit'],
                row['Year Made'],
                number,
                row['Color'],
                tradeable,
                row['Source']
            ]

            sql_parts = []
            for val in values:
                if val in ['TRUE', 'FALSE', 'NULL'] or str(val).isdigit():
                    sql_parts.append(val)
                else:
                    # Escape single quotes inside strings
                    safe_val = val.replace("'", "''")
                    sql_parts.append(f"'{safe_val.strip()}'")

            print(f" ({', '.join(sql_parts)}),")

# 🔧 Example usage
csv_to_sql_values('clothes.csv')  # replace with the path to your CSV file
