# Take-home project

## Choice of project

I immediately ruled out the Space Invaders game, because it sounded like it would be a little too frontend heavy for me to pull off in a reasonable amount of time.

I initially wanted to give the LISP parser a shot, but when I realized I know nothing about LISP or the details about Abstract Syntax Trees it occurred to me that it would be incredibly difficult to look up answers without actually seeing implementations in the process, which defeats the purpose.

As such, Tic Tac Toe it is!

## Running the game

```
bundle install
ruby play_game.rb
```

The board's squares are zero-based. Player 1 always starts.

## Goal-setting

My assumption with this assignment is that it's not about delivering a perfect solution. It's about showing that I know Ruby, sharing my thought process, and communication.

As such I'm not going to spend too much time getting the game to be exactly right, let alone look great.

I decided to use a library for some of the heavy lifting in terms of user input as it made things a bit quicker and less error-prone. At that point, all my code needs to do is keep some sort of representation of the board and the status of the game and then loop until either a winner is found or the board is full.

## Taking it further

There are a bunch of things that could be tackled in a next phase should this be taken further.

The below list is a few things that could be worked on in case we'd want to clean this up or make it better.

* Players aren't currently objects, which means that there's some messy translating from an integer of 1 or 2 into the symbols. With proper extraction we could change who goes first, let them choose "o" or "x", and even store a player name for them.
* File organization is nearly non-existant, and tests are very limited and heavy-handed without any sort of meta-programming to make them more concise.
* The interface is just terminal output. We could draw the board in a nicer way using any number of libraries. We could also add colors, or perhaps use a table of sorts to draw the board.
* Choosing which square to play next is lacking any sort of design or good user experience right now. We'd probably want to try using a cursor to select the square if possible, or at the very least do something like coordinates (A1 and C3) to select a square rather than the zero-based 0 to 8 (for 9 total squares) choices we have now.
* The TicTacToe class does nothing. Perhaps it'd have been better to add a `play_game` method there. We could even track the score across multiple games.
* One of the first refactors I'd most likely end up making is one where I extract the terminal interactions from the code, so that I could at the very least have a simple end-to-end test to ensure the code won't blow up when being run.