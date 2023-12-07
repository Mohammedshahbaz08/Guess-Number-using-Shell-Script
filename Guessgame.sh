#!/bin/bash

target=$((1 + RANDOM % 100))
attempts=0
max_attempts=5

echo "Welcome to the Guessing Game! Guess the number between 1 and 100."

while (( attempts < max_attempts )); do
    read -p "Enter your guess: " guess

    if [[ ! $guess =~ ^[0-9]+$ ]]; then
        echo "Please enter a valid number."
        continue
    fi

    (( attempts++ ))

    if (( guess == target )); then
        echo "Congratulations! You guessed the correct number in $attempts attempts."
        exit
    elif (( guess < target )); then
        echo "Try a higher number."
    else
        echo "Try a lower number."
    fi
done

echo "Sorry, you've reached the maximum number of attempts. The number was $target."

