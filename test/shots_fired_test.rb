require_relative 'test_helper'
require './lib/shots_fired'

class ShotsFiredTest < Minitest::Test
  def test_it_exists_and_initializes_with_game_board_and_display
    shots_board = GameBoard.new
    shots = ShotsFired.new(shots_board, 'A1')

    assert_instance_of GameBoard, shots.shots_board
    assert_instance_of DisplayBoard, shots.shots_display
    assert_equal [], shots.shots_board.all_shots
  end

  def test_firing_shots_populates_all_shots
    shots_board = GameBoard.new
    shots = ShotsFired.new(shots_board, 'A1')
    shots.shot_is_fired

    assert_equal ['A1'], shots_board.all_shots

    shots = ShotsFired.new(shots_board, 'C3')
    shots.shot_is_fired

    assert_equal ['A1', 'C3'], shots_board.all_shots
  end

  def test_check_for_win_initiates_win_sequence
    skip
    #something here
  end

  def test_render_shot_on_gameboard_renders_shot_in_addition_to_previous_shots
    shots_board = GameBoard.new
    shots = ShotsFired.new(shots_board, 'A1')
    shots.shots_board.all_shots = ['A1']

    shots.render_shot_on_game_board
  end

  def test_shot_response_knows_hit_or_miss_and_provides_appropriate_message
    shots_board = GameBoard.new
    shots = ShotsFired.new(shots_board, 'B2')

    #check for message about hits here, shots.shot_response(['B2'])

    more_shots = ShotsFired.new(shots_board, 'C3')

    #check for message about miss here, shots.shot_response(['B2'])
  end

end
