This project is to create the game of Connect Four with Ruby. The project will be done with the TDD process as a
means of learning how to implement testing when creating coding projects.

Initial Plan

Problem: Create a game of Connect Four. Connect Four is a 2-player game where players take turns dropping colors discs
into a seven column, six row vertically suspended grid.

Elements of the game
2 players
6x7 grid
Player may only select which column to drop their disc into
The selected column must also have available space
Winner determined by any row of 4 discs of the same color(vertical, horizontal, and diagonal)

Test plan

*Start of game
**An empty grid is created

*Player's turn
**A player selects a column and their corresponding colored disc into dropped to the lowest available row
**Error is given if player selects a filled row

*Winning
**A player has a vertical row of 4 discs
**A player has a horizontal row of 4 discs
**A player has a diagonal row of 4 discs
**The grid is filled with no rows of 4 same colored discs, game is a tie

Pseudocode

class Player
*var wins
*var name

class board
*array of arrays to create a 6x7 matrix

*public methods
**display
***Will display the grid in its current state
**AddDisc(player, column)
***Will take a player and column number as arguments and will fill the lowest avaiable space said column with a disc
corresponding to said player if possible. If the column is filled then an error msg is displayed and the player must
select another column
**winner?
***Will check if there is a winner or if the grid is filled

main
Player1 = Player.new
Player2 = Player.new
Grid = board.new

until winner?
prompt player1 for a column
call AddDisc(player1, column)
prompt player2 for a column
call AddDisc(player2, column)

