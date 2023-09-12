#!/bin/bash

# Check if the whois command is available
if ! command -v whois &>/dev/null; then
  echo "Error: whois command not found. Please install it before running this script."
  exit 1
fi

# Check if the input file is provided as an argument
if [ $# -ne 1 ]; then
  echo "Usage: $0 <domain_list_file>"
  exit 1
fi

input_file="$1"

# Check if the input file exists
if [ ! -f "$input_file" ]; then
  echo "Error: Input file '$input_file' not found."
  exit 1
fi

# Loop through each domain in the input file
while IFS= read -r domain; do
  echo "Domain: $domain"
  whois "$domain" | grep -E 'Creation Date:|Registrant Organization:'
  echo "---------------------------"
done < "$input_file"

exit 0
