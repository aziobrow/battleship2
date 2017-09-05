require_relative 'test_helper'
require './lib/game_board'
require './lib/shots_fired'

class GameBoardTest < Minitest::Test

  def test_it_initializes_into_array_of_four_arrays_with_rows_and_columns
    game_board = GameBoard.new

    assert_instance_of Array, game_board.board
    assert_equal 4, game_board.board.count
    assert_equal [], game_board.two_unit_ship
    assert_equal [], game_board.three_unit_ship
    assert_equal [], game_board.all_shots

    assert_equal [{"A1"=>nil}, {"A2"=>nil}, {"A3"=>nil}, {"A4"=>nil}], game_board.board[0]
    assert_equal [{"B1"=>nil}, {"B2"=>nil}, {"B3"=>nil}, {"B4"=>nil}], game_board.board[1]
    assert_equal [{"C1"=>nil}, {"C2"=>nil}, {"C3"=>nil}, {"C4"=>nil}], game_board.board[2]
    assert_equal [{"D1"=>nil}, {"D2"=>nil}, {"D3"=>nil}, {"D4"=>nil}], game_board.board[3]
  end

  def test_it_can_find_a_row_of_board
    game_board = GameBoard.new

    assert_equal [{"B1"=>nil}, {"B2"=>nil}, {"B3"=>nil}, {"B4"=>nil}], game_board.find_row('B')
  end

  def test_it_can_find_a_column_of_board
    game_board = GameBoard.new

    assert_equal [{"A2"=>nil}, {"B2"=>nil}, {"C2"=>nil}, {"D2"=>nil}], game_board.find_column('2')
  end

  def test_it_can_collect_keys_of_game_board_row
    game_board = GameBoard.new
    row = game_board.board[0]

    assert_equal ['A1', 'A2', 'A3', 'A4'], game_board.collect_keys(row)
  end

  def test_it_can_collect_keys_of_game_board_column
    game_board = GameBoard.new
    column = game_board.find_column('3')

    assert_equal ['A3', 'B3', 'C3', 'D3'], game_board.collect_keys(column)
  end

  def test_it_can_find_winning_coordinates
    game_board = GameBoard.new
    game_board.two_unit_ship = ['A1','A2']

    assert_equal ['A1', 'A2'], game_board.winning_coordinates

    game_board.three_unit_ship = ['B3', 'C3', 'D3']

    assert_equal ['A1', 'A2', 'B3', 'C3', 'D3'], game_board.winning_coordinates
  end

  def test_it_can_get_all_keys
    game_board = GameBoard.new
    expected_value = ["A1", "A2", "A3", "A4",
                      "B1", "B2", "B3", "B4",
                      "C1", "C2", "C3", "C4",
                      "D1", "D2", "D3", "D4"]

    assert_equal expected_value, game_board.get_all_keys
  end

  def test_it_can_find_game_square
    game_board = GameBoard.new

    assert_equal ({'A1'=>nil}), game_board.find_game_square('A1')

    key1 = game_board.board[0][3].keys[0]
    game_board.board[0][3] = {key1 => true}

    assert_equal ({'A4'=>true}), game_board.find_game_square('A4')
  end

  def test_a_shot_updates_all_shots
    game_board = GameBoard.new
    shot = ShotsFired.new(game_board, 'B2')
    shot.shot_is_fired

    assert_equal ['B2'], game_board.all_shots
  end

end
