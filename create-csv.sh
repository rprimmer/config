#!/bin/sh

# Convert MD table to csv

awk -F '|' 'NR == 1 {
    # Process the header row
    header = ""; # Initialize header string
    for (i=2; i<=NF-1; i++) {
        gsub(/^[ \t]+|[ \t]+$/, "", $i); # Trim leading and trailing spaces from header names
        header = header (i>2 ? "," : "") $i; # Append header name to header string, prepend comma if not first field
    }
    print header; # Print the header row
    next; # Skip to the next record
}
{
    # Replace markers with Yes or No
    gsub(/:white_check_mark:/, "Yes", $0);
    gsub(/:x:/, "No", $0);

    if (NR > 2) { # Skip the separator line
        outputLine = ""; # Initialize output line
        for (i=2; i<=NF-1; i++) { # Iterate through the fields, ignoring the first and last empty fields
            gsub(/^[ \t]+|[ \t]+$/, "", $i); # Trim leading and trailing spaces from each field
            outputLine = outputLine (i>2 ? "," : "") $i; # Append field to output line, prepend comma if not first field
        }
        # Skip printing the line if it consists only of dashes (after replacements)
        if (outputLine !~ /^[-,]+$/) {
            print outputLine; # Print the cleaned and formatted line
        }
    }
}' $1
