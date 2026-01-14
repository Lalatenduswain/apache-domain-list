#!/bin/bash
# Apache Domain-to-Directory Mapping Script
# Lists all enabled virtual hosts with their ServerName and DocumentRoot

SITES_ENABLED="/etc/apache2/sites-enabled"

echo "======================================================================"
echo "          Apache Virtual Host Domain-to-Directory Mappings"
echo "======================================================================"
printf "%-45s | %s\n" "DOMAIN" "DIRECTORY"
echo "----------------------------------------------------------------------"

for conf in "$SITES_ENABLED"/*.conf; do
    [ -f "$conf" ] || continue

    config_name=$(basename "$conf")
    server_name=""
    server_alias=""
    doc_root=""

    while IFS= read -r line; do
        # Extract ServerName
        if [[ $line =~ ^[[:space:]]*ServerName[[:space:]]+(.+)$ ]]; then
            server_name="${BASH_REMATCH[1]}"
        fi
        # Extract ServerAlias
        if [[ $line =~ ^[[:space:]]*ServerAlias[[:space:]]+(.+)$ ]]; then
            server_alias="${BASH_REMATCH[1]}"
        fi
        # Extract DocumentRoot
        if [[ $line =~ ^[[:space:]]*DocumentRoot[[:space:]]+(.+)$ ]]; then
            doc_root="${BASH_REMATCH[1]}"
        fi
    done < "$conf"

    # Print if we have at least ServerName
    if [ -n "$server_name" ]; then
        printf "%-45s | %s\n" "$server_name" "$doc_root"
        # Print alias if exists
        if [ -n "$server_alias" ]; then
            printf "%-45s | %s\n" "  (alias: $server_alias)" ""
        fi
    else
        printf "%-45s | %s\n" "[$config_name - No ServerName]" "$doc_root"
    fi
done

echo "======================================================================"
echo "Total config files scanned: $(ls -1 "$SITES_ENABLED"/*.conf 2>/dev/null | wc -l)"
