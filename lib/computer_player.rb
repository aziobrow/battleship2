require_relative 'game_board'

class ComputerPlayer

  attr_reader :computer_board

  def initialize
    @computer_board = GameBoard.new
  end

  def choose_first_coordinate
    row = @computer_board.rows.sample
    column = @computer_board.columns.sample

    coordinate = row.concat(column)
  end

  def coin_flip
    coin_flip = ['heads', 'tails'].sample
  end

  def next_coordinate_in_row(coordinate, size)
    coordinate[0].concat((coordinate[1].to_i + size).to_s)
  end

  def previous_coordinate_in_row(coordinate, size)
    coordinate[0].concat((coordinate[1].to_i - size).to_s)
  end

  def next_coordinate_in_column(coordinate, size)
    (coordinate[0].codepoints[0] + size).chr.concat(coordinate[1])
  end

  def previous_coordinate_in_column(coordinate, size)
    (coordinate[0].codepoints[0] - size).chr.concat(coordinate[1])
  end

  def invalid_previous?(coordinate, size)
    previous_in_row = previous_coordinate_in_row(coordinate, size)
    previous_in_column = previous_coordinate_in_column(coordinate, size)
    return false if previous_in_row.include?("@") or previous_in_row.include?("?")
    return false if previous_in_column.include?("0") or previous_in_column.include?("/")
    true
  end

  def invalid_next?(coordinate, size)
    next_in_row = next_coordinate_in_row(coordinate, size)
    next_in_column = next_coordinate_in_column(coordinate, size)
    return false if next_in_row.include?('E') or next_in_row.include?('F')
    return false if next_in_row.include?('5') or next_in_row.include?('6')
    true
  end

  def rig_the_coin_flip(coordinate)
    if invalid_next?(coordinate)
      coin_flip = 'tails'
    elsif invalid_previous?(coordinate)
      coin_flip = 'heads'
    else
      coin_flip
    end
  end

  def randomly_choose_coordinates_same_row(coordinate, ship_length)
    rig_the_coin_flip(coordinate)
    if coin_flip == 'heads'
      next_coordinate_in_row(coordinate, ship_length)
    else
      previous_coordinate_in_row(coordinate, ship_length)
    end
  end

  def randomly_choose_coordinates_same_column(coordinate, ship_length)
    rig_the_coin_flip(coordinate)
    if coin_flip == 'heads'
      next_coordinate_in_column(coordinate, ship_length)
    else
      previous_coordinate_in_column(coordinate, ship_length)
    end
  end

end
