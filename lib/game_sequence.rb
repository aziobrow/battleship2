require_relative 'user_interaction'
require_relative 'game_board'
require_relative 'computer_player'
require_relative 'shots_fired'
require_relative 'ships'
require_relative 'coordinates'

class GameSequence

  def initialize
    @user_interaction = UserInteraction.new
    @player_board = GameBoard.new
    @ai_board = GameBoard.new
    @ai = ComputerPlayer.new(@ai_board)
    @ai_shots = ShotsFired.new(@ai_board)
    @player_shots = ShotsFired.new(@player_board)
  end

  def initiate_game_sequence
    introductory_phase
  end

  def introductory_phase
    welcome_choice = @user_interaction.display_welcome_screen
    if @user_interaction.user_wants_to_quit?(welcome_choice)
      @user_interaction.quit_program
    elsif @user_interaction.user_wants_instructions?(welcome_choice)
      @user_interaction.display_game_instructions
    elsif @user_interaction.user_is_ready_to_play?(welcome_choice)
      computer_ship_placement_phase
      user_ship_placement_phase
      shot_sequence
      end_game_sequence
    else
      @instructions.display_welcome_screen
    end
  end

  def computer_ship_placement_phase
    computer_two_ship_placement
    computer_three_ship_placement
  end

  def computer_two_ship_placement
    ai_two_unit_coordinates = @ai.choose_ship_coordinates(1)
    Ships.new(ai_two_unit_coordinates, @ai_board).mark_ships
  end

  def computer_three_ship_placement
    #add part about putting in third coordinate
    ai_three_unit_coordinates = @ai.choose_ship_coordinates(2)
    coordinate_validation = Coordinates.new(ai_three_unit_coordinates, @ai_board)
    if not coordinate_validation.already_occupied?
      coordinate_validation.generate_valid_coordinates
      Ships.new(ai_three_unit_coordinates, @ai_board).mark_ships
    else
      computer_three_ship_placement
    end
  end

  def user_ship_placement_phase
    user_two_ship_placement
    user_three_ship_placement
  end

  def user_two_ship_placement
    user_two_unit_coordinates = @user_interaction.choose_two_unit_ship.split
    user_coordinate_validation(user_two_unit_coordinates)
  end

  def user_three_ship_placement
    user_three_unit_coordinates = @user_interaction.choose_three_unit_ship.split
    user_coordinate_validation(user_three_unit_coordinates)
  end

  #put this in battleship class user_two_unit_coordinates = @user_interaction.place_two_unit_ship
  #do again for user three_unit_coordinates

  def user_coordinate_validation(coordinates)
    coordinate_validation = Coordinates.new(coordinates, @player_board)
    if not coordinate_validation.invalid_ship_placement?
      validated_coordinates = coordinate_validation.generate_valid_coordinates
      Ships.new(validated_coordinates, @player_board).mark_ships
    else
      new_coordinates = @user_interaction.invalid_ship_placement_message.split
      user_ship_placement(new_coordinates)
    end
  end


  def user_takes_shot
    user_shot = @user_interaction.enter_shot_coordinate
    if @player_shots.duplicate_shot?(user_shot)
      @user_interaction.invalid_shot_message
      user_takes_shot
    else
      @player_shots.valid_shot_is_fired(user_shot)
    end
  end

  def computer_takes_shot
    ai_shot = @ai.choose_first_coordinate#make sure this is array of string
    if @ai_shots.duplicate_shot?(ai_shot)
      computer_takes_shot
    else
      @ai_shots.valid_shot_is_fired(ai_shot)
    end
  end


  def shot_sequence
    ai_win_condition = @ai_shots.shots_board.winning_positions
    player_win_condition = @player_shots.shots_board.winning_positions
    until @ai_shots.win?(ai_win_condition) || @player_shots.win?(player_win_condition)
      user_takes_shot
      computer_takes_shot
    end
  end

  def end_game_sequence
    ai_win_condition = @ai_shots.shots_board.winning_positions
    player_win_condition = @player_shots.shots_board.winning_positions
    if @ai_shots.win?(ai_win_condition)
      @user_interaction.player_lost
    else
      @user_interaction.player_won
    end
  end







end
