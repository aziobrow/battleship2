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

  def test_coin_flip_returns_heads_or_tails
    ai_player = ComputerPlayer.new
    result = ai_player.coin_flip

    assert ['heads', 'tails'].include?(result)
  end

  def test_it_can_name_next_coordinate_in_row
    ai_player = ComputerPlayer.new
    next_coordinate = ai_player.next_coordinate_in_row('C2', 1)

    assert_equal 'C3', next_coordinate

    next_coordinate = ai_player.next_coordinate_in_row('C2', 2)

    assert_equal 'C4', next_coordinate
  end

  def test_it_can_name_previous_coordinate_in_row
    skip
    ai_player = ComputerPlayer.new
    previous_coordinate = ai_player.previous_coordinate_in_row('D3')

    assert_equal 'D2', previous_coordinate
  end

  def test_it_can_name_next_coordinate_in_column
    skip
    ai_player = ComputerPlayer.new
    next_coordinate = ai_player.next_coordinate_in_column('C2')

    assert_equal 'D2', next_coordinate
  end

  def test_it_can_name_previous_coordinate_in_column
    skip
    ai_player = ComputerPlayer.new
    previous_coordinate = ai_player.previous_coordinate_in_column('D3')

    assert_equal 'C3', previous_coordinate
  end

  # def test_it_can_randomly_choose_coordinate_in_same_row
  #   ai_player = ComputerPlayer.new
  #   first_coordinate = 'C2'
  #   random_coordinate = ai_player.randomly_choose_coordinates_same_row(first_coordinate)
  #
  #   assert ['C1', 'C3'].include?(random_coordinate)
  # end
  #
  # def test_it_can_randomly_choose_coordinate_in_same_column
  #   ai_player = ComputerPlayer.new
  #   first_coordinate = 'B2'
  #   random_coordinate = ai_player.randomly_choose_coordinates_same_column(first_coordinate)
  #
  #   assert ['A2', 'C2'].include?(random_coordinate)
  # end

end
