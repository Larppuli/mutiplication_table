#!/bin/bash

# Check for the correct number of command line arguments
if [ $# -ne 2 ]; then
    echo "Enter two arguments"
    exit 1
fi

# Define number of lines and columns
rows=$1
cols=$2

# Check if inputs are valid
if ! [[ $rows =~ ^[1-9][0-9]*$ && $cols =~ ^[1-9][0-9]*$ ]]; then
    echo "Invalid input"
    exit 1
fi

# Function to calculate the number of spaces based on the length of the product
calculate_spaces() {
    local product_length=${#1}
    local max_length=3

    if [ $product_length -lt $max_length ]; then
        local num_spaces=$((max_length - product_length))
        printf "%*s" $num_spaces " "
    else
        printf " "
    fi
}

# Print the multiplication table
for ((i = 1; i <= rows; i++)); do
    for ((j = 1; j <= cols; j++)); do
        product=$((i * j))
        printf "%d*%d=%d" $i $j $product
        calculate_spaces $product
    done
    echo
done
