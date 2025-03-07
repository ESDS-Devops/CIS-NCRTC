#!/bin/bash

# Define input and output files
TEMP_LIST="temp_list.lst"
TASK_DIR="/home/ncrtcadmin/patch-automation/SUSE15_CIS/tasks"
DEFAULTS_FILE="/home/ncrtcadmin/patch-automation/SUSE15_CIS/defaults/main.yml"
OUTPUT_FILE="output.txt"

# Ensure the output file is empty before writing
> "$OUTPUT_FILE"

# Read temp_list.lst line by line
while IFS=' ' read -r CIS_NO CIS_NAME; do
    # Search for exact CIS_NAME match and extract CIS_TASK_NO
    MATCHES=$(grep -iR --include="*.yml" -E "\|\s*$CIS_NAME$" "$TASK_DIR" | awk -F'|' '{print $2}' | xargs | tr ' ' '\n' | sort -u | xargs)

    if [[ -n "$MATCHES" ]]; then
        for CIS_TASK_NO in $MATCHES; do
            # Convert CIS_TASK_NO to corresponding rule name format
            CIS_RULE_NAME="suse15cis_rule_${CIS_TASK_NO//./_}"
            
            # Check if the rule exists in main.yml
            RULE_LINE=$(grep -n "^$CIS_RULE_NAME:" "$DEFAULTS_FILE")

            if [[ -n "$RULE_LINE" ]]; then
                # Extract line number
                LINE_NO=$(echo "$RULE_LINE" | cut -d: -f1)

                # Enable rule by setting it to true
                sed -i "${LINE_NO}s/false/true/" "$DEFAULTS_FILE"

                # Write success entry to output file
                echo "$CIS_NO;$CIS_TASK_NO;$CIS_NAME;$CIS_RULE_NAME;$LINE_NO;successfully enabled" >> "$OUTPUT_FILE"
            else
                # Rule not found in defaults file
                echo "$CIS_NO;$CIS_TASK_NO;$CIS_NAME;$CIS_RULE_NAME;N/A;fail" >> "$OUTPUT_FILE"
            fi
        done
    else
        # No matching CIS_TASK_NO found
        echo "$CIS_NO;N/A;$CIS_NAME;N/A;N/A;fail" >> "$OUTPUT_FILE"
    fi
done < "$TEMP_LIST"

echo "Processing complete. Check output.txt"

