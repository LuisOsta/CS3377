#!/bin/bash
randValOne=$((RANDOM %128))
echo $randValOne
totalGuesses=0

# initial guess
read -p "Enter your guess: " userGuess
if [ $userGuess -lt $randValOne ]; then
    echo -e "Low Guess\n"
else
    echo -e "High Guess\n"
fi

# repeated guess attempts
let totalGuesses+=1
while [ $userGuess -ne $randValOne ]; do
    read -p "Enter your guess: " userGuess
    if [ $userGuess -lt $randValOne ]; then
        echo -e "Low Guess\n"
    else
        echo -e "High Guess\n"
    fi

    let totalGuesses+=1
done

# gets user info
read -p "Enter username: " username
echo -e "HIGH SCORES"
echo $username" "$totalGuesses >> "output.txt"

#outputs results
awk NF "output.txt" > "output.temp.txt" && mv "output.temp.txt" "output.txt"
sort -k 2,2 -n -o "output.txt" "output.txt"
eval head -3 "output.txt"
