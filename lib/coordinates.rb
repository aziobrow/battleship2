require_relative 'game_board'

class Coordinates

  attr_reader :coordinates_to_check, :game_board

  def initialize(coordinates, game_board = GameBoard.new)
    @coordinates_to_check = coordinates
    @game_board = game_board
  end

  def keys_include_both_coordinates?(keys)
    (keys & @coordinates_to_check) == @coordinates_to_check
  end

  def same_row?
    game_board.board.each do |row|
      keys = game_board.collect_keys(row)
      return true if keys_include_both_coordinates?(keys)
    end
    false
  end

  def same_column?
    column_position = @coordinates_to_check[0][1]
    column = game_board.find_column(column_position)

    keys = game_board.collect_keys(column)
    game_board.board.each do |row|
      return true if keys_include_both_coordinates?(keys)
    end
    false
  end

  def count_coordinate_range
    if same_row?
      columns = @coordinates_to_check.collect { |coordinate| coordinate[1]  }
      columns[1].to_i - columns[0].to_i
    elsif same_column?
      rows = @coordinates_to_check.collect { |coordinate| coordinate[0][0]  }
      rows[1].codepoints[0] - rows[0].codepoints[0]
    else
      p "Sorry, this range is invalid."
    end
  end

  def coordinates_exist?
    all_keys = @game_board.get_all_keys
    return true if (all_keys & @coordinates_to_check) == @coordinates_to_check
    false
  end

end
