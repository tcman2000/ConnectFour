require './lib/connect4.rb'

#Test cases for player class
describe Player do
  #Constructor test
  describe "#initialize" do
    it "creates a Player class with a name and 0 wins" do
      one = Player.new('Titan')
      expect(one.name).to eql('Titan')
      expect(one.wins).to eql(0)
    end
  end
end

#Test cases for board class
describe Board do

  #Constructor test
  describe "#initialize" do
    it "creates a Board class with a 6x7 grid of 0s(representing empty)" do
      gameBoard = Board.new
      expect(gameBoard.grid.size). to eql(6)
      gameBoard.grid.each { |row|
        expect(row.length). to eql(7)
      }
    end
  end

  #Tests for #display
  describe "#display" do
    #Note these tests require a visual confirmation

    #display an empty board
    it "Displays an empty game board" do
      gameBoard = Board.new
      gameBoard.display
      expect(true)
    end

    #display a non-empty board
    it "Displays a non-empty game board" do
      gameBoard = Board.new
      gameBoard.add_disc(1, 1)
      gameBoard.display
      expect(false)
    end

    #display a filled board
    it "Displays a filled game board" do
      gameBoard = Board.new
      gameBoard.grid = Array.new(6) { Array.new(7) { 1 } }
      gameBoard.display
      expect(false)
    end
  end

  describe "#add_disc" do
    it "Drops a disc into an empty column" do
      gameBoard = Board.new
      gameBoard.add_disc(1, 0)
      expect(gameBoard.grid[5][0]).to eql(1)
      gameBoard.display
    end

    it "Drops a disc into a non-empty column" do
      gameBoard = Board.new
      gameBoard.add_disc(1, 0)
      gameBoard.add_disc(1, 0)
      expect(gameBoard.grid[4][0]).to eql(1)
      gameBoard.display
    end

    it "Drops a disc into a filled column" do
      gameBoard = Board.new
      for i in 0..6
        gameBoard.add_disc(1, 0)
      end
      gameBoard.display
    end

    it "Drops disc and results in a horizontal win" do
      gameBoard = Board.new
      for i in 0...4
        gameBoard.add_disc(1, i)
      end
      gameBoard.display
      expect(gameBoard.winner?(1)).to eql(true)
    end

    it "Drops a disc and results in a vertical win" do
      gameBoard = Board.new
      for i in 0...4
        gameBoard.add_disc(1, 0)
      end
      gameBoard.display
      expect(gameBoard.winner?(1)).to eql(true)
    end

    it "Drops a disc and results in a diagonal win" do
      gameBoard = Board.new
      gameBoard.add_disc(2, 0)
      gameBoard.add_disc(2, 0)
      gameBoard.add_disc(2, 0)
      gameBoard.add_disc(2, 1)
      gameBoard.add_disc(2, 1)
      gameBoard.add_disc(2, 2)
      gameBoard.add_disc(1, 0)
      gameBoard.add_disc(1, 1)
      gameBoard.add_disc(1, 2)
      gameBoard.add_disc(1, 3)
      gameBoard.display
      expect(gameBoard.winner?(1)).to eql(true)
    end
  end

end