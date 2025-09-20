#!/bin/bash

# Remove existing README.md if it exists
[ -f README.md ] && rm README.md

# List of files
files=(
  "backend/README.md"
  "frontend/README.md"
)

# Create new README.md
echo "# Cash Register App" > README.md

echo -e "\n[Live Site - cash-register.felixabacajen.site](https://cash-register.felixabacajen.site/)\n" >> README.md
echo -e "[Backend API Endpoint - api.cash-register.felixabacajen.site](https://api.cash-register.felixabacajen.site/)" >> README.md

# Append each file with a header
for file in "${files[@]}"; do
  section=$(basename "$file" | sed 's/\.[^.]*$//' | tr '[:lower:]' '[:upper:]')
  echo -e "\n### $section [$file]($file)\n" >> README.md
  cat "$file" >> README.md
  echo -e "\n---" >> README.md
done
