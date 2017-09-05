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

  def invalid_previous?(coordinate, size)
    previous_in_row = previous_coordinate_in_row(game_square, size)
    previous_in_column = previous_coordinate_in_column(game_square, size)
    return true if previous_in_row.include?("0") or previous_in_row.include?("/")
    return true if previous_in_column.include?("@") or previous_in_column.include?("?")
    false
  end

  def invalid_next?(coordinate, size)
    next_in_row = next_coordinate_in_row(game_square, size)
    next_in_column = next_coordinate_in_column(game_square, size)
    return true if next_in_row.include?('5') or next_in_row.include?('6')
    return true if next_in_row.include?('E') or next_in_row.include?('F')
    false
  end

  def choose_row_or_column
    ['row', 'column'].sample
  end

  def valid_two_unit_ships#not sure about this one
    if choose_row_or_column == 'row'
      next_coordinate_in_row
    else
      next_coordinate_in_column
    end
  end

  def next_coordinate_in_row(first_coordinate_square, size)
    row_index = @computer_board.find_game_square_row(first_coordinate_square)
    column_index = @computer_board.find_game_square_column(first_coordinate_square)
    row = @computer_board.board[row_index]
    next_game_square = row[column_index + size]
    next_game_square.keys[0]
  end

  def next_coordinate_in_column(first_coordinate_square, size)
    column_index = @computer_board.find_game_square_column(first_coordinate_square)
    row_index = @computer_board.find_game_square_row(first_coordinate_square)
    column = @computer_board.collect_column(column_index+1)
    next_game_square = column[row_index + size]
    next_game_square.keys[0]
  end

  def previous_coordinate_in_row(first_coordinate_square, size)
    row_index = @computer_board.find_game_square_row(first_coordinate_square)
    column_index = @computer_board.find_game_square_column(first_coordinate_square)
    row = @computer_board.board[row_index]
    previous_game_square = row[column_index - size]
    previous_game_square.keys[0]
  end

  def next_coordinate_in_column(first_coordinate_square, size)
    column_index = @computer_board.find_game_square_column(first_coordinate_square)
    row_index = @computer_board.find_game_square_row(first_coordinate_square)
    column = @computer_board.collect_column(column_index+1)
    previous_game_square = column[row_index - size]
    previous_game_square.keys[0]
  end





end
