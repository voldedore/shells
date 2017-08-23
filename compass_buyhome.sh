#!/bin/bash

# Check arguments
if [ $# -eq 0 ]
 then
	echo "Usage: compass_buyhome <directory_to_scss_source>"
	exit 1
fi

SCSS_DIR="$1"

# Check dir exist (arg is valid)
if [ ! -d "${SCSS_DIR}" ]; then
	echo "Sorry but this dir does not exist."
	exit 2
fi

cd "${SCSS_DIR}"

# Looking for config.rb and config.prod.rb
DEV_CFG="$1/config.rb"
PROD_CFG="$1/config.prod.rb"

# Check if there are those 2 files
if [ ! -r "${PROD_CFG}" ] || [ ! -r "${DEV_CFG}" ]; then
	echo "2 files config.rb or config.prod.rb not found"
	exit 3
fi

#TODO: check if compass installed

## MAIN PROCESS
# Clean css dir
echo "Cleaning output dir..."
rm -r "../css"
mkdir "../css"

# Run prod env
echo "Compiling production files..."
/usr/local/bin/compass compile -c config.prod.rb --force

# Then cp to min files
for file in ../css/*.css
do
  mv "$file" "../css/${file/.css/.min.css}"
done

# Run dev env
echo "Compiling developement files"
/usr/local/bin/compass compile -c config.rb --force

exit 0