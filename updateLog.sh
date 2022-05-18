#!/bin/sh
echo "Checking if a commit is needed today"

# read in space invaders pattern
PATTERN=$(head -n 1 pattern.txt)

# calculate days since May 15 2022
MAY_15_2022=1652572800
RUN_TIME=$(date +%s)
SECONDS_ELAPSED=$((RUN_TIME - MAY_15_2022))
DAYS_ELAPSED=$((SECONDS_ELAPSED / (60 * 60 * 24)))

# DAYS_ELAPSED=1

# calculate the offset, correcting overflow
OFFSET=$(( $DAYS_ELAPSED  % 364 ))
echo "The offset is $OFFSET"

# map the offset to the value in the pattern
PATTERN_VALUE=${PATTERN:OFFSET:1}

# conditionally write to a text file
if ((PATTERN_VALUE == 0)); then
   echo "The pattern value is 0"        
fi

if ((PATTERN_VALUE == 1)); then
   echo "The pattern value is 1, so a commit will be made"   
   printf $"Made a commit at: $(date)\n" >> log.txt     
fi