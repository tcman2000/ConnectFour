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
      expect(false)
    end

    #display a filled board
    it "Displays a filled game board" do
      gameBoard = Board.new
    end
  end

  describe "#addDisc" do
    it "Drops a disc into an empty column" do
      gameBoard = Board.new
      gameBoard.addDisc(1, 0)
      expect(gameBoard.grid[5][0]).to eql(1)
      gameBoard.display
    end

    it "Drops a dis into a non-empty column" do
      
    end

    it "Drops a disc into a filled column" do
      
    end
  end

end