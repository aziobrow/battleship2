require_relative 'test_helper'
require './lib/display_board'
require './lib/game_board'

class DisplayBoardTest < Minitest::Test

  def test_it_exists_and_initializes_with_game_board
    display = DisplayBoard.new

    assert_instance_of DisplayBoard, display
    assert_instance_of GameBoard, display.board
  end
end
