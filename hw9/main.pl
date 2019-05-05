#!/bin/perl -w
$allowedGuesses = 7;
$numOfGuesses = 0;
$randVal = generateNum();
$reportFileName = "gameReport.txt";
print "The value has been generated";
print "You have $allowedGuesses guesses to guess the random number\n";
$userGuess = 0;

do {

    printf("Guess the generated random value: ");
    $userGuess = <>;
    printf("\nYou guessed $userGuess");

    getFeedback();

    #add to the number of guesses
    $numOfGuesses = $numOfGuesses + 1;
}while($userGuess != $randVal && $numOfGuesses < $allowedGuesses);

resultFeedback();
outputReport();

sub outputReport {
    print("What is your username: ");
    $userName = <>;
    chomp $userName;
    open(my $fh, '>>', $reportFileName) or die "Could not open file '$reportFileName'";
    print $fh "$userName $numOfGuesses\n";
    close $fh;

}

sub generateNum {
    $max = 200;
    $min = 100;
    return int(rand($max - $min)) + $min;
}

sub getFeedback {
    if($userGuess > $randVal) {
        printf("Too High.\n");
    } elsif($userGuess < $randVal) {
        printf("Too Low.\n");
    } else {
        printf("Just Right.\n");
    }
}

sub resultFeedback {
    if($numOfGuesses >= $allowedGuesses) {
        printf("\nIt took you more than the allowed $allowedGuesses to correctly guess the number.\n");
        printf("You attempted to guess the value $numOfGuesses times\n");
    } else {
        printf("\nIt took you $numOfGuesses to guess the random value\n");
        printf("Congratulations on correctling guessing the number $randVal!\n");
    }
}