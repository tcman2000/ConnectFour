# Class to represent the players of the game
class Player
  attr_accessor :name, :wins

  def initialize(name)
    @name = name
    @wins = 0
  end
end

# Class to represent the game board
class Board
  attr_accessor :grid

  def initialize
    @grid = Array.new(6) { Array.new(7) { 0 } }
  end

  def display
    puts ''
    @grid.each { |row|
      puts row.join(' ')
    }
  end

  def add_disc(player, column)
    if @grid[0][column] != 0
      puts 'The column is already filled'
    else
      for i in 0..5
        if @grid[5 - i][column].zero?
          @grid[5 - i][column] = player
          break
        end
      end
    end
  end

  def winner?(player)
    win = false
    # Diagonal win check
    # \ diagonal win check
    for row in 0..2
      for column in 0..3
        result = [0, 1, 2, 3].all? { |index| @grid[row + index][column + index] == player}
        if result
          win = result
        end
      end
    end
    # / diagonal win check
    for row in 0..2
      for column in 3..6
        result = [0, 1, 2, 3].all? { |index| @grid[row + index][column - index] == player}
        if result
          win = result
        end
      end
    end

    # Horizontal win check
    for row in 0..5
      for column in 0..3
        result = [0, 1, 2, 3].all? { |index| @grid[row][column + index] == player }
        if result
          win = result
        end
      end
    end

    # Vertical win check
    for column in 0..6
      for row in 0..2
        result = [0, 1, 2, 3].all? { |index| @grid[row + index][column] == player }
        if result
          win = result
        end
      end
    end

    win
  end
end

print 'Enter the name of player 1: '
Player1 = Player.new(gets.chomp)
print 'Enter the name of player 2: '
Player2 = Player.new(gets.chomp)
grid = Board.new
winner = 0

grid.display
until grid.winner?(2) || grid.winner?(1)
  print 'Player 1, Enter a column to drop a disc in: '
  grid.add_disc(1, gets.chomp.to_i - 1)
  grid.display
  unless grid.winner?(1)
    print 'Player 2, Enter a column to drop a disc in: '
    grid.add_disc(2, gets.chomp.to_i - 1)
    grid.display
  else
    winner = 1
  end
end

if winner == 1
  puts "#{Player1.name} wins"
else
  puts "#{Player2.name} wins"
end
