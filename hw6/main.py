import random;

def genRandNum(min, max):
    return random.randint(min, max)


userScore = 0;
numToGuess = genRandNum(-100, 100)
print("The number to guess: ", numToGuess)

allowedGuessed = 7
counter = 0;

# User guesses the random number
while(counter < allowedGuessed):
    userGuess = int(input("What's your guess: "))
    if(userGuess == numToGuess):
        userScore+=1
        break;
    # user guess is too big
    elif(userGuess > numToGuess):
        print("High Guess")
        userScore+=1
        counter+=1
    #user score is too low
    else:
        print("Low Guess")
        userScore+=1
        counter+=1      
if(counter > allowedGuessed):
    print("\nThe number wasn't guessed in the allowed number of attempts")
    print("You only have", allowedGuessed, "guesses")
else:
    print("\nYou've guessed it correctly!")

userName = input("What's your username: ")
with open("gamescore.txt", "w") as scoreFile:
    scoreFile.write(userName+ " "+str(userScore)+"\n")
