class GameSequence

  def initialize
    @user_interaction = UserInteraction.new
    @player_board = GameBoard.new
    @ai_board = GameBoard.new
    @ai = ComputerPlayer.new(@ai_board)
    @welcome_screen = WelcomeScreen.new
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

  def user_two_ship_placement
    user_two_unit_coordinates = @user_interaction.place_two_unit_ship
    coordinate_validation = Coordinates.new(user_two_unit_coordinates)
    coordinate_validation.invalid_ship_placement?







end
