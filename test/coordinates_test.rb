require_relative 'test_helper'
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

end
