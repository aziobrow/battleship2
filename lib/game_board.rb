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

  
  def win_condition
    @board.each do |row|
      row.each_key do |game_square|
        @winning_positions << row[key] if row[key] != nil
      end
    end
  end

end
