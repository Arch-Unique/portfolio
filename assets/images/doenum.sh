#!/bin/bash

# Define the assets array
assets=(
  arduino
  css3
  dart
  embeddedc
  express
  firebase
  flutter
  github
  googlecloud
  html5
  java
  javascript
  mysql
  python
  raspberrypi
  ruby
  sequelize
  solidity
)

# Generate the enum code
echo "enum Skills {"
for asset in "${assets[@]}"; do
  level=$((RANDOM % 6))  # Randomize the level
  capitalized_name="$(tr '[:lower:]' '[:upper:]' <<< ${asset:0:1})${asset:1}"
  echo "  ${asset}(\"${capitalized_name}\", Assets.${asset}, ${level}),"
done
echo ""
echo "  final String name, icon;"
echo "  final int no;"
echo "  const Skills(this.name, this.icon, this.no);"
echo "}"

