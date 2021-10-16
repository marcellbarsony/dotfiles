clear

SAYINGS=(
    "So long and thanks for all the fish.\n  -- Douglas Adams"
    "I'll be back.\n  -- Arnold Schwarzenegger"
)

# Print a random saying
echo $SAYINGS[$(($RANDOM % ${#SAYINGS} + 1))]