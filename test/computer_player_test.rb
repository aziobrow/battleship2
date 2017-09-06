require_relative 'test_helper'
require './lib/computer_player'
require './lib/game_board'

class ComputerPlayerTest < Minitest::Test

  def test_it_exists_and_initializes_with_game_board
    ai_player = ComputerPlayer.new

    assert_instance_of ComputerPlayer, ai_player
    assert_instance_of GameBoard, ai_player.computer_board
  end

  def test_it_can_randomly_choose_first_coordinate
    ai_player = ComputerPlayer.new
    coordinate = ai_player.choose_first_coordinate

    assert ['A','B','C','D'].include?(coordinate[0])
    assert ['1', '2', '3', '4'].include?(coordinate[1])
  end

  def test_it_can_list_all_possible_coordinates_from_first_coordinate
    ai_player = ComputerPlayer.new
    square = ai_player.computer_board.find_game_square('B2')

    assert_equal ['B3', 'C2', 'B1', 'A2'], ai_player.list_possible_coordinates(square, 1)

    square = ai_player.computer_board.find_game_square('D3')

    assert_equal ['D1', 'B3'], ai_player.list_possible_coordinates(square, 2)
  end

  def test_it_can_find_indices_of_game_square
    ai_player = ComputerPlayer.new
    square = ai_player.computer_board.find_game_square('A4')

    assert_equal [0,3], ai_player.find_indices(square)

    square = ai_player.computer_board.find_game_square('D1')

    assert_equal [3,0], ai_player.find_indices(square)

  end

  def test_it_can_name_next_coordinates_in_row_and_column
    ai_player = ComputerPlayer.new
    square = ai_player.computer_board.find_game_square('B1')

    assert_equal ['B2', 'C1'], ai_player.next_coordinates(square, 1)
  end

  def test_it_can_name_next_coordinate_in_row
    ai_player = ComputerPlayer.new

    assert_equal 'C3', ai_player.next_coordinate_in_row([2,1], 1)

    assert_equal 'B3', ai_player.next_coordinate_in_row([1,0], 2)
  end

  def test_it_can_name_next_coordinate_in_column
    ai_player = ComputerPlayer.new

    assert_equal 'D2', ai_player.next_coordinate_in_column([2,1], 1)

    assert_equal 'C2', ai_player.next_coordinate_in_column([0,1], 2)
  end

  def test_it_can_name_previous_coordinates_in_row_and_column
    ai_player = ComputerPlayer.new
    square = ai_player.computer_board.find_game_square('C3')

    assert_equal ['C2', 'B3'], ai_player.previous_coordinates(square, 1)

    assert_equal ['C1', 'A3'], ai_player.previous_coordinates(square, 2)
  end

  def test_it_can_name_previous_coordinate_in_row
    ai_player = ComputerPlayer.new

    assert_equal 'B1', ai_player.previous_coordinate_in_row([1,1], 1)

    assert_equal 'D1', ai_player.previous_coordinate_in_row([3,2], 2)
  end

  def test_it_can_name_previous_coordinate_in_column
    ai_player = ComputerPlayer.new

    assert_equal 'A2', ai_player.previous_coordinate_in_column([1,1], 1)

    assert_equal 'B3', ai_player.previous_coordinate_in_column([3,2], 2)
  end

  def test_it_can_name_coordinates_of_two_unit_ship
    ai_player = ComputerPlayer.new

    p ai_player.choose_ship_coordinates(1)
  end

  def test_it_can_name_coordinates_of_three_unit_ship
    ai_player = ComputerPlayer.new


    p ai_player.choose_ship_coordinates(2)
  end

end
