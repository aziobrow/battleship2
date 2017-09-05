class GameBoard

  attr_reader :board, :rows, :columns, :winning_positions

  def initialize
    @rows = ['A', 'B', 'C', 'D']
    @columns = ['1', '2', '3', '4']
    @board = setup_board
    @winning_positions = []
  end

  def setup_board
    @rows.map do |letter|
      @columns.map do |number|
        key = letter + number
        {key => nil}
      end
    end
  end

  def winning_coordinates
    ship_coordinates = []
    @board.each do |row|
      row.each do |game_square|
        ship_coordinates << game_square.keys if game_square.values[0] != nil
      end
    end
    ship_coordinates.flatten
  end

end
