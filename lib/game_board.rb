class GameBoard

  attr_reader :board, :rows, :columns, :winning_positions

  def initialize
    @rows = ['A', 'B', 'C', 'D']
    @columns = ['1', '2', '3', '4']
    @board = setup_board
    @winning_positions = []
  end

  def setup_board
    board = Array.new(4).map {|row| Array.new(4)}
    board = board.map.with_index do |row, index|
      row = row.map.with_index do |game_square, index|
        keys = create_keys(@rows[index])
        game_square_key = [keys[index]]
        game_square = Hash[game_square_key.map {|key| [key,nil]}]
        row[index] = game_square
      end
    end
    board
  end

  def setup_row(index)
    keys = create_keys(@rows[index])
    game_square = Hash.new
    game_square[keys[index]] = nil
  end

  def create_keys(letter)
    keys = []
    @columns.each do |number|
      keys << letter + number
    end
    keys
  end

  def win_condition
    @board.each do |row|
      row.each_key do |game_square|
        @winning_positions << row[key] if row[key] != nil
      end
    end
  end

end
