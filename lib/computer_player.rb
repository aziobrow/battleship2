require_relative 'game_board'

class ComputerPlayer
  #fetch--uses index to pull value

  attr_reader :computer_board

  def initialize
    @computer_board = GameBoard.new
  end

  def choose_first_coordinate
    random_row = ['A','B','C','D'].sample
    random_column = ['1','2','3','4'].sample
    first_coordinate = random_row.concat(random_column)

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
    if indices[1] + size > 3
      return nil
    else
      next_game_square = row[indices[1] + size]
      next_game_square.keys[0]
    end
  end

  def next_coordinate_in_column(indices, size)
    column = @computer_board.collect_column(indices[1]+1)
    if indices[0] + size > 3
      return nil
    else
      next_game_square = column[indices[0] + size]
      next_game_square.keys[0]
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

  def choose_ship_coordinates(size)
    #sometimes returns A1 and A4
    coordinate_one = choose_first_coordinate
    space = @computer_board.find_game_square(coordinate_one)
    coordinate_two = list_possible_coordinates(space, size).sample
    [coordinate_one, coordinate_two]
    #mark ship by creating ships.new
  end

  #second time call with size 2
  #coordinates.new
  #add third coordinate
  #already occupied?

  #look for .fetch--i think could really help refactor

end
