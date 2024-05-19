#! /usr/bin/env nix-shell
#! nix-shell -i bash -p bash

# Verzeichnis, das überwacht werden soll
base_dir="/mnt/work/Git"

# Zielverzeichnis für die generierte JSON-Datei
output_dir="../generated/"

# Funktion, um die 5 neuesten bearbeiteten Unterverzeichnisse zu finden
get_latest_subdirectories() {
    # Sucht nach Unterverzeichnissen im Basisverzeichnis und listet sie auf,
    # sortiert sie nach der letzten Änderungszeit (mtime) und gibt die neuesten 5 aus.
    find "$base_dir" -mindepth 1 -maxdepth 1 -type d -printf "%T@ %p\n" | sort -n -r | head -n 5
}

# Funktion, um den JSON-String für ein einzelnes Unterverzeichnis zu generieren
generate_folder_json() {
    local path="$1"
    local folder_name=$(basename "$path")
    local icon=" "  # Hier die gewünschte Glyphe einfügen
    # Begrenzt den Ordnername auf maximal 10 Zeichen und füllt ihn mit Leerzeichen auf, falls kürzer
    folder_name=$(printf '%-9s' "${folder_name:0:9}")
    echo "{ \"format\": \"$icon $folder_name\", \"on-click\": \"nautilus '$path'\" }"
}

# Hauptfunktion zum Ausführen des Skripts
main() {
    # Ruft die Funktion auf, um die neuesten Unterverzeichnisse zu erhalten
    latest_subdirectories=$(get_latest_subdirectories)

    # Öffnet die Ausgabedatei und schreibt das JSON-Objekt
    echo "{" > "$output_dir/folders.json"
    for ((i = 1; i <= 5; i++)); do
        subdir=$(echo "$latest_subdirectories" | sed -n "${i}p" | cut -d ' ' -f 2-)
        if [ -n "$subdir" ]; then
            json=$(generate_folder_json "$subdir")
            echo "\"custom/folder#$i\": $json," >> "$output_dir/folders.json"
        fi
    done
    # Entfernt das letzte Komma
    sed -i '$ s/,$//' "$output_dir/folders.json"
    echo "}" >> "$output_dir/folders.json"
}

main


