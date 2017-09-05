require_relative 'test_helper'
require './lib/display_board'
require './lib/game_board'

class DisplayBoardTest < Minitest::Test

  def test_it_exists_and_initializes_with_board_and_labels_and_layout_and_coordinates
    board = GameBoard.new
    display = DisplayBoard.new(board)

    assert_instance_of DisplayBoard, display
    assert_instance_of GameBoard, display.board
    assert_instance_of Array, display.board_layout
    assert_equal ["A", "B", "C", "D"], display.row_label
    assert_equal ["1", "2", "3", "4"], display.column_label
  end

  def test_it_renders_board
    board = GameBoard.new
    display = DisplayBoard.new(board)

    display.render_board
  end

  def test_it_renders_shot
    board = GameBoard.new
    display = DisplayBoard.new(board)

    display.render_shot('C2')

    board.winning_positions = ['A1', 'A2']

    display.render_shot('A1')
  end

end
