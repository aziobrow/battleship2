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
    column = game_board.collect_column(column_position)

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

  def already_occupied?
    @coordinates_to_check.each do |coordinate|
      game_square = @game_board.find_game_square(coordinate)
      return true if game_square.values[0] == true
    end
    false
  end

  def three_coordinates?
    length = count_coordinate_range
    return true if length == 2
    false
  end

  def add_third_coordinate_for_same_row
    first_coordinate = @coordinates_to_check[0]
    middle_coordinate = first_coordinate.next
    third_coordinate = middle_coordinate.next
    three_coordinates = [first_coordinate, middle_coordinate, third_coordinate]
  end

  def add_third_coordinate_for_same_column
    column = @game_board.collect_column(@coordinates_to_check[0][1])
    column_keys = column.map {|game_square| game_square.keys}.flatten
    index = column_keys.index(@coordinates_to_check[0])
    first_coordinate = column_keys[index]
    middle_coordinate = column_keys[index + 1]
    third_coordinate = column_keys[index + 2]
    three_coordinates = [first_coordinate, middle_coordinate, third_coordinate]
  end

  def invalid_ship_placement? #put in ships class?
    coordinates = @coordinates_to_check
    return true if coordinates.length != 2
    return true if same_column? && same_row?
    return true if !(same_column? || same_row?)
    return true if already_occupied?
    return true if count_coordinate_range > 2
    return true if !coordinates_exist?
    # return true if count_coordinate_range == 2 and @three_unit_ship == true
    # return true if count_coordinate_range == 1 and @two_unit_ship == true
    false
  end

  def generate_valid_coordinates
    p "Sorry, invalid coordinates. Try again." and return if invalid_ship_placement?
    if three_coordinates? && same_row?
      add_third_coordinate_for_same_row
    elsif three_coordinates? && same_column?
      add_third_coordinate_for_same_column
    else
      @coordinates_to_check
    end
  end

end
