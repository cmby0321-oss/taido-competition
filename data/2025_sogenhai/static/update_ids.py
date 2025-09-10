#!/usr/bin/env python3
import csv
import sys

def main():
    if len(sys.argv) != 2:
        print("Usage: python update_ids.py <category>")
        print("Example: python update_ids.py hokei_kyuui_man")
        print("Example: python update_ids.py zissen_kyuui_man")
        sys.exit(1)
    
    category = sys.argv[1]
    csv_file = f"{category}.csv"
    column_name = f"{category}_player_id"
    
    # Determine column index based on category
    column_mapping = {
        "zissen_man_player_id": 4,
        "hokei_man_player_id": 5,
        "zissen_woman_player_id": 6,
        "hokei_woman_player_id": 7,
        "zissen_kyuui_man_player_id": 8,
        "hokei_kyuui_man_player_id": 9,
        "zissen_kyuui_woman_player_id": 10,
        "hokei_kyuui_woman_player_id": 11,
        "hokei_newcommer_player_id": 12
    }
    
    if column_name not in column_mapping:
        print(f"Error: Unknown category '{category}'")
        print("Available categories:", list(column_mapping.keys()))
        sys.exit(1)
    
    column_index = column_mapping[column_name]
    
    # Read category CSV to create id->name mapping
    id_to_name = {}
    try:
        with open(csv_file, 'r', encoding='utf-8') as f:
            reader = csv.reader(f)
            for row in reader:
                if len(row) >= 2 and row[0] and row[1]:
                    try:
                        id_val = int(row[0])
                        name = row[1]
                        id_to_name[name] = id_val
                    except ValueError:
                        continue
    except FileNotFoundError:
        print(f"Error: File '{csv_file}' not found")
        sys.exit(1)
    
    # Read players.csv
    players_data = []
    with open('players.csv', 'r', encoding='utf-8') as f:
        reader = csv.reader(f)
        for row in reader:
            players_data.append(row)
    
    # Update specified column
    for i, row in enumerate(players_data):
        if i == 0:  # Skip header
            continue
        if len(row) > column_index:
            name = row[2]  # name column
            if name in id_to_name:
                row[column_index] = str(id_to_name[name])
    
    # Write updated players.csv
    with open('players.csv', 'w', encoding='utf-8', newline='') as f:
        writer = csv.writer(f)
        writer.writerows(players_data)
    
    print(f"Updated {column_name} column successfully")

if __name__ == "__main__":
    main()
