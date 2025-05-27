

# https://docs.google.com/spreadsheets/d/1dypZYhmZwUdyGHL9AQbGjufo91mDgLkBQbb5uhgDdv8/edit?usp=sharing	
# https://docs.google.com/spreadsheets/d/1dypZYhmZwUdyGHL9AQbGjufo91mDgLkBQbb5uhgDdv8/edit?gid=0#gid=0


#!/bin/sh
CWD=$(pwd)
LOCALIZATION_RELATIVE_PATH="assets/localization"
LOCALIZATION_DIR="$CWD/$LOCALIZATION_RELATIVE_PATH"

# Replace DOC_ID and SHEET_ID if you have another Google sheets url
DOC_ID="1dypZYhmZwUdyGHL9AQbGjufo91mDgLkBQbb5uhgDdv8"
SHEET_ID="0"
DOWNLOAD_URL="https://docs.google.com/spreadsheets/d/$DOC_ID/export?format=csv&gid=$SHEET_ID"
OUTPUT_FILE_NAME="localization.csv"

# Downloading CSV file from URL and saving it to LOCALIZATION_DIR
cd $LOCALIZATION_DIR; curl -L $DOWNLOAD_URL  -o $OUTPUT_FILE_NAME

# Generating ARB files for each language
cd $CWD && dart run arb_generator

# Generating AppLocalizations variables
cd $CWD && flutter gen-l10n