#!/bin/bash

# part 1
randValOne=$((RANDOM %9 +1))
randValTwo=$((RANDOM %9 +1))
if [ $randValOne -eq $randValTwo ]; then
    echo "Match Found"
else
    echo "Different Numbers"
fi
echo $randValOne
echo $randValTwo

# part 2
if [ $# -ge 1 ]; then
    randGen=$((RANDOM%9 + 1))
    if [ $1 -eq $randGen ]; then
        echo "Computer Generated The Same Number"
    else
        echo "Computer Did Not Generate The Same Number"
    fi
else
    echo "No args were supplied"
fi

# part 3
if [ $# -ge 1 ]; then
    if [ -f "$1" ]; then
        echo "The argument is an ordinary file in the working directory"
    else
        echo "The argument is not an ordinary file in the working directory"
    fi

else
    echo "No args were supplied"
fi

# part 4
read -p 'Do you like Pizza(Y/N)?: ' response
cleanedResponse=${response,,}

case "$cleanedResponse" in
"yes")
    echo "Agreed"
    ;;
"y")
    echo "Agreed"
    ;;
"no")
    echo "Disagreed"
    ;;
"n")
    echo "Disagreed"
    ;;
*)
    echo "Invalid Input"
    ;;
esac

# part 5
read -p 'Enter Word One: ' wordOne
read -p 'Enter Word Two: ' wordTwo
read -p 'Enter Word Three: ' wordThree

if [ $wordOne = $wordTwo ] &&  [ $wordOne = $wordThree ]; then
    echo "All three words match"
elif [ $wordOne = $wordTwo ] || [ $wordOne = $wordThree ] || [ $wordTwo = $wordThree ]; then
    echo "Two words match"
else
    echo "No words match"
fi

# part 6
for f in ./*; do
    if [ -d "$f" ]; then
        echo "$(basename "$f")"
    fi
done
echo $totalDirs

# part 7
read -p 'Enter the filename: ' file
COUNTER=0
    while [ $COUNTER -lt 100 ]; do
        randVal=$((RANDOM % 99))
        echo $randVal >> $file
        let COUNTER+=1
    done

# part 8
read -p 'Enter the filename: ' file
COUNTER=0
    until [ $COUNTER -ge 100 ]; do
        randVal=$((RANDOM % 99))
        echo $randVal >> $file
        let COUNTER+=1
    done