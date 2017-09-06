class GameSequence

  def initialize
    @user_interaction = UserInteraction.new
    @player_board = GameBoard.new
    @ai_board = GameBoard.new
    @ai = ComputerPlayer.new(@ai_board)
    @ai_shots = ShotsFired.new(@ai_board)
    @player_shots = ShotsFired.new(@player_board)
  end



  def introductory_phase
    welcome_choice = @user_interaction.display_welcome_screen
    if @user_interaction.user_wants_to_quit?(welcome_choice)
      @user_interaction.quit_program
    elsif @user_interaction.user_wants_instructions?(welcome_choice)
      @user_interaction.display_game_instructions
    elsif @user_interaction.user_is_ready_to_play?(welcome_choice)
      user_two_ship_placement
    else
      @instructions.display_welcome_screen
    end
  end

  def computer_two_ship_placement_phase
    ai_two_unit_coordinates = @ai.choose_ship_coordinates(1)
    Ships.new(ai_two_unit_coordinates, @ai_board).mark_ships
  end

  def computer_three_ship_placement_phase
    ai_three_unit_coordinates = @ai.choose_ship_coordinates(2)
    coordinate_validation = Coordinates.new(ai_three_unit_coordinates, @ai_board)
    if not coordinate_validation.already_occupied?
      coordinate_validation.generate_valid_coordinates
      Ships.new(ai_two_unit_coordinates, @ai_board).mark_ships
    else
      computer_three_ship_placement_phase
    end
  end

  #put this in battleship class user_two_unit_coordinates = @user_interaction.place_two_unit_ship
  #do again for user three_unit_coordinates

  def user_ship_placement(coordinates)
    coordinate_validation = Coordinates.new(coordinates, @player_board)
    if not coordinate_validation.invalid_ship_placement?
      generate_valid_coordinates
    else
      new_coordinates = @user_interaction.invalid_ship_placement_message
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
    until @ai_shots.win? || @player_shots.win?
      user_takes_shot
      computer_takes_shot
    end
  end

  def winning_sequence
    if @ai_shots.win?
      @user_interaction.player_lost
    else
      @user_interaction.player_won
    end
  end







end
