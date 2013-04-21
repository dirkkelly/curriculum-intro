#Rock Paper Scissors Exercise

###Iteration 1
Work on the following fundamentals:

* local variables
* loops
* conditionals
* receiving input (gets)
* basic use of collection (array)

The user experience should resemble the following
    What's your move: rock
    The computer chose paper
    You Lose: paper beats rock

###Iteration 2
Work on the following fundamentals:

* classes
* instance methods
* instance variables
* requiring files

Refactor the code so that instead of having all of the logic that determines who wins each round inside the while loop, the logic is stored in its own class.  This class should be stored in its own file and need to be required.

The user experience should resemble the following


    RPSCalculator.new(my_move, computer_move).calculate


The return value should be a string stating either a win, loss, or tie.


###Iteration 3
Work on the following fundamentals:

* Api calls
* JSON parsing

Instead of having the logic for randomly selecting the computer's move inside the loop, use Faraday to send a `GET` request to a given address that will return the computer's move.  The student will then have to parse this JSON response to properly pass it into the RPSCalculator class.
