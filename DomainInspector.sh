#!/bin/bash

# Ask for the filename containing top-level domains
read -p "Enter the filename containing top-level domains: " input_file

# Ask for the filename to save the output
read -p "Enter the filename to save the output: " output_file

# Ask for the field to search for
read -p "Enter the field to search for (e.g., Registrant Email): " search_field

# Iterate through each domain in the input file
while IFS= read -r domain; do
    # Use whois to query domain information and search for the specified field
    if whois "$domain" | grep -q "$search_field"; then
        # If the specified field is found, write the domain to the output file
        echo "$domain" >> "$output_file"
    fi
done < "$input_file"

echo "Done. Output saved to $output_file."
