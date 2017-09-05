require_relative 'test_helper'
require './lib/game_board'
require './lib/coordinates'

class CoordinatesTest < Minitest::Test

  def test_it_initializes_with_coordinates_and_a_game_board
    coordinates = Coordinates.new(['C3', 'C4'])

    assert_instance_of Coordinates, coordinates
    assert_equal ['C3', 'C4'], coordinates.coordinates_to_check
    assert_instance_of GameBoard, coordinates.game_board
  end

  def test_it_knows_when_keys_include_both_coordinates
    coordinates = Coordinates.new(['C3', 'C4'])
    keys = ['C1', 'C2', 'C3', 'C4']

    assert coordinates.keys_include_both_coordinates?(keys)

    coordinates = Coordinates.new(['A1', 'A3'])

    refute coordinates.keys_include_both_coordinates?(keys)

    coordinates = Coordinates.new(['A1', 'C3'])

    refute coordinates.keys_include_both_coordinates?(keys)
  end

  def test_it_knows_coordinates_are_in_same_row
    coordinates = Coordinates.new(['C3', 'C4'])

    assert coordinates.same_row?

    coordinates = Coordinates.new(['B3', 'C4'])

    refute coordinates.same_row?
  end

  def test_it_knows_coordinates_are_in_same_column
    coordinates = Coordinates.new(['A1', 'D1'])

    assert coordinates.same_column?

    coordinates = Coordinates.new(['A1', 'A3'])

    refute coordinates.same_column?
  end

  def test_it_can_count_coordinate_range
    coordinates = Coordinates.new(['B1', 'D1'])

    assert_equal 2, coordinates.count_coordinate_range

    coordinates = Coordinates.new(['C1', 'C3'])

    assert_equal 2, coordinates.count_coordinate_range

    coordinates = Coordinates.new(['A1', 'A2'])

    assert_equal 1, coordinates.count_coordinate_range

    coordinates = Coordinates.new(['B1', 'D2'])

    assert_equal "Sorry, this range is invalid.", coordinates.count_coordinate_range
  end

  def test_it_knows_if_coordinates_exist_on_gameboard
    coordinates = Coordinates.new(['A1', 'A3'])

    assert coordinates.coordinates_exist?

    coordinates = Coordinates.new(['A1', 'E3'])

    refute coordinates.coordinates_exist?

    coordinates = Coordinates.new(['C2', 'B7'])

    refute coordinates.coordinates_exist?
  end

  def test_it_knows_if_coordinates_have_already_been_chosen
    coordinates = Coordinates.new(['A1', 'A3'])

    refute coordinates.already_occupied?

    game_board = GameBoard.new
    key1 = game_board.board[0][3].keys[0]
    game_board.board[0][3] = {key1 => true}

    coordinates = Coordinates.new(['A4', 'B4'], game_board)

    assert coordinates.already_occupied?
  end



end
