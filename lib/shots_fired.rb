require './lib/game_board'
require './lib/display_board'

class ShotsFired

  attr_reader :all_shots, :shots_board, :shots_display, :shot_coordinate

  def initialize(game_board, shot_coordinate)
    @shots_board = game_board
    @shots_display = DisplayBoard.new(@shots_board)
    @shot_coordinate = shot_coordinate
  end

  def check_for_win(hits)
    if (@shots_board.all_shots & hits) == hits
        #return win sequence
    end
  end

  def render_shot_on_game_board
    @shots_display.render_shot(@shot_coordinate)
  end

  def shot_is_fired
    hits = @shots_board.winning_positions
    @shots_board.all_shots << @shot_coordinate
    shot_response(hits)
    render_shot_on_game_board
  end

  def shot_response(hits)
    if hits.include?(@shot_coordinate)
      #message about hits
      check_for_win(hits)
    else
      #message about miss
    end
  end

end
