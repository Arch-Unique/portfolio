#!/bin/bash

# Loop through all .svg files in the current directory
# for file in *-plain.svg
# do
  # Replace the fill with #5429cff using sed
 # sed -i 's/fill="#[[:xdigit:]]\{6\}"/fill="#5429cf"/g' "$file"
# done
# for file in *-plain.svg; do
  # Rename the file to remove the -plain suffix
  # mv "$file" "${file/-plain/}"
# done
for file in *-original.svg
do
  sed -i 's/fill="#[[:xdigit:]]\{6\}"/fill="#5429cf"/g' "$file"
  mv "$file" "${file/-original/}"
done
