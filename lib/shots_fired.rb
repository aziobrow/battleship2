require './lib/game_board'
require './lib/display_board'

class ShotsFired

  attr_reader :all_shots, :shots_board, :shots_display, :shot_coordinate

  def initialize(game_board)
    @shots_board = game_board
    @shots_display = DisplayBoard.new(@shots_board)
  end

  def win?(hits)
    (@shots_board.all_shots & hits) == hits
  end

  def render_shot_on_game_board(shot)
    @shots_display.render_shot(shot)
  end

  def duplicate_shot?(shot)
    @shots_board.all_shots.include?(shot)
  end

  def valid_shot_is_fired(shot)
    hits = @shots_board.winning_positions
    @shots_board.all_shots << shot
    shot_response(hits, shot)
    render_shot_on_game_board(shot)
  end

  def shot_response(hits, shot)
    if hits.include?(shot)
      UserInteraction.new.hit_message
    else
      UserInteraction.new.miss_message
    end
  end

end
