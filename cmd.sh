#!/usr/bin/env bash
set -e

# calculate coverage
declare -i total_statements total_hits line_statements line_hits
# lines in form: "location statement_count hit_count"
while read -r line; do
  # ignore mode lines
  if [[ $line != mode* ]] ;
  then
    IFS=' ' read -ra line_parts <<< "$line"
    line_statements=${line_parts[1]}
    line_hits=${line_parts[2]}

    # increment statements
    total_statements=$total_statements+$line_statements

    if [[ $line_statements -gt $line_hits ]] ;
    then
      total_hits=$total_hits+$line_hits
    else
      total_hits=$total_hits+$line_statements
    fi
  fi
done < /coverprofile

coverage=$(($total_hits*100 / $total_statements))
echo "Coverage info => Actual: $coverage%, Expected: >= $minCoverage%"

# enforce minCoverage
if [[ $coverage -lt $minCoverage ]] ;
then
  echo "Insufficient test coverage!" 1>&2
  exit 1
else
  echo "Coverage ok"
fi
