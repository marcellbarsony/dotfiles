clear

SAYINGS=(
    "So long and thanks for all the fish.\n  -- Douglas Adams"
    "Good morning! And in case I don't see ya, good afternoon, good evening and goodnight.\n  --Truman Burbank"
)

# Print a random saying
echo $SAYINGS[$(($RANDOM % ${#SAYINGS} + 1))]