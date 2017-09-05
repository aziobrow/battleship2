require_relative 'test_helper'
require './lib/game_board'

class GameBoardTest < Minitest::Test

  def test_it_initializes_into_array_of_four_arrays_with_rows_and_columns
    game_board = GameBoard.new

    assert_instance_of Array, game_board.board
    assert_equal 4, game_board.board.count

    assert_equal [{"A1"=>nil}, {"A2"=>nil}, {"A3"=>nil}, {"A4"=>nil}], game_board.board[0]
    assert_equal [{"B1"=>nil}, {"B2"=>nil}, {"B3"=>nil}, {"B4"=>nil}], game_board.board[1]
    assert_equal [{"C1"=>nil}, {"C2"=>nil}, {"C3"=>nil}, {"C4"=>nil}], game_board.board[2]
    assert_equal [{"D1"=>nil}, {"D2"=>nil}, {"D3"=>nil}, {"D4"=>nil}], game_board.board[3]
  end

  def test_it_can_find_winning_coordinates
    game_board = GameBoard.new
    key1 = game_board.board[0][3].keys[0]
    key2 = game_board.board[1][2].keys[0]
    game_board.board[0][3] = {key1 => true}
    game_board.board[1][2]= {key2 => true}

    assert_equal ['A4', 'B3'], game_board.winning_coordinates
  end


end
