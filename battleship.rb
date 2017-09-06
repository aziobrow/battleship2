require './lib/instructions'

class Battleship

  attr_reader :instructions, :player_board, :ai_board, :player, :ai

  def initialize
    @instructions = Instructions.new
    @player_board = GameBoard.new
    @ai_board = GameBoard.new
    @ai = ComputerPlayer.new
  end
end
