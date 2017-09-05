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

  def find_row(letter)
    position = @rows.index(letter)
    row = @board[position]
  end

  def find_column(number)
    position = @columns.index(number)
    column = @board.map {|row| row[position]}
  end

  def collect_keys(row_or_column)
    keys = row_or_column.map {|game_square| game_square.keys}
    keys.flatten
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

  def get_all_keys
    all_keys = []
    @board.each do |row|
      row.each do |game_square|
        all_keys << game_square.keys
      end
    end
    all_keys.flatten
  end

  def find_key_value(value)
    @board.each do |row|
      row.each do |game_square|
        return game_square[value] if value == game_square.keys[0]
      end
    end
  end

end
