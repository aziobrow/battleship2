require_relative 'game_board'

class ComputerPlayer

  attr_reader :computer_board

  def initialize
    @computer_board = GameBoard.new
  end

  def choose_first_coordinate
    row = @computer_board.rows.sample
    column = @computer_board.columns.sample

    first_coordinate = row.concat(column)
  end

  def list_possible_coordinates(first_coordinate_square, size)
      right_and_up_spaces = next_coordinates(first_coordinate_square, size)
      left_and_down_spaces = previous_coordinates(first_coordinate_square, size)
      possibilities = right_and_up_spaces.concat(left_and_down_spaces)
      possibilities.compact
  end

  def find_indices(first_coordinate_square)
    row_index = @computer_board.find_game_square_row(first_coordinate_square)
    column_index = @computer_board.find_game_square_column(first_coordinate_square)
    indices = [row_index, column_index]
  end

  def next_coordinates(first_coordinate_square, size)
    possible_coordinates = []
    indices = find_indices(first_coordinate_square)
    possible_coordinates << next_coordinate_in_row(indices, size)
    possible_coordinates << next_coordinate_in_column(indices, size)
  end

  def next_coordinate_in_row(indices, size)
    row = @computer_board.board[indices[0]]
    if indices[1] + size < 4
      next_game_square = row[indices[1] + size]
      next_game_square.keys[0]
    else
      return nil
    end
  end

  def next_coordinate_in_column(indices, size)
    column = @computer_board.collect_column(indices[1]+1)
    if indices[0] + size < 4
      next_game_square = column[indices[0] + size]
      next_game_square.keys[0]
    else
      return nil
    end
  end

  def previous_coordinates(first_coordinate_square, size)
    possible_coordinates = []
    indices = find_indices(first_coordinate_square)
    possible_coordinates << previous_coordinate_in_row(indices, size)
    possible_coordinates << previous_coordinate_in_column(indices, size)
  end

  def previous_coordinate_in_row(indices, size)
    row = @computer_board.board[indices[0]]
    previous_game_square = row[indices[1]- size]
    previous_game_square.keys[0]
  end

  def previous_coordinate_in_column(indices, size)
    column = @computer_board.collect_column(indices[1]+1)
    previous_game_square = column[indices[0] - size]
    previous_game_square.keys[0]
  end

end
