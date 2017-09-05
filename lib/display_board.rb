require_relative 'game_board'

class DisplayBoard

  def initialize(board = GameBoard.new)
    @board = board
  end

end
