class Player
  attr_accessor :name, :wins

  def initialize(name)
    @name = name
    @wins = 0
  end
end

class Board
  attr_accessor :grid

  def initialize
    @grid = Array.new(6) { Array.new(7) { 0 } }
  end

  public

  def display
    puts ""
    @grid.each { |row|
      puts row.join(' ')
    }
  end

  def addDisc(player, column)
    if @grid[0][column] != 0
      puts "The column is already filled"
    else
      for i in 0..5
        if @grid[5 - i][column].zero?
          @grid[5 - i][column] = player
          break
        end
      end
    end
  end

  private

  def winner?
  end

end
