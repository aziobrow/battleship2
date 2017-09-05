require_relative 'test_helper'
require './lib/ships'
require './lib/coordinates'

class ShipsTest < Minitest::Test

  def test_it_initializes_with_valid_coordinates_and_game_board_and_ship_flags
    validated_coordinates = Coordinates.new(['A1', 'A2']).generate_valid_coordinates
    ships = Ships.new(validated_coordinates)

    assert_instance_of Ships, ships
    assert_instance_of GameBoard, ships.game_board
    assert_equal ['A1', 'A2'], ships.validated_coordinates
    assert_equal [], ships.game_board.two_unit_ship
    assert_equal [], ships.game_board.three_unit_ship
  end

  def test_it_can_mark_placement_of_ships
    validated_coordinates = Coordinates.new(['A1', 'A2']).generate_valid_coordinates
    ships = Ships.new(validated_coordinates)

    ships.mark_ships

    assert ships.game_board.find_game_square('A1').values[0]
    assert ships.game_board.find_game_square('A2').values[0]
    refute ships.game_board.find_game_square('C3').values[0]
  end

  def test_it_marks_two_unit_and_three_unit_ships_as_placed
    validated_coordinates = Coordinates.new(['C2', 'D2']).generate_valid_coordinates
    ships = Ships.new(validated_coordinates)
    used_game_board = ships.game_board
    ships.mark_ships

    assert_equal ['C2', 'D2'], ships.game_board.two_unit_ship.flatten
    assert_equal [], ships.game_board.three_unit_ship

    validated_coordinates = Coordinates.new(['B1', 'B3']).generate_valid_coordinates

    ships = Ships.new(validated_coordinates, used_game_board)
    ships.mark_ships

    assert_equal ['C2', 'D2'], ships.game_board.two_unit_ship.flatten
    assert_equal ['B1', 'B2', 'B3'], ships.game_board.three_unit_ship.flatten
  end
end
