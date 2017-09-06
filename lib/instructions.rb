class Instructions

  def display_welcome_screen
    p "Welcome to BATTLESHIP"
    p "Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
    player_choice = gets.chomp.downcase
  end

  def play_game
    p "I have laid out my ships on the grid."
    p "You now need to layout your two ships."
    p "The first is two units long and the second is three units long."
    p "The grid has A1 at the top left and D4 at the bottom right."
    p "Enter the squares for the two-unit ship:"

    coordinates = gets.chomp
  end

  def display_game_instructions
    p "To become the winner, you must sink all of your opponent's ships."
    p "Players will begin by naming coordinates at which to place their own ships."
    p "On your turn, you will name a coordinate at which you think an opponent's ship may be located."
    p "The board will then be updated with a hit or a miss."
    p "Then, your opponent will have an opportunity to take a shot at your ships."
    p "Once all coordinates of a ship have been hit, that ship is sunk."
    p "The game is over when all of a player's ships have been sunk."
    p "Press enter to continue"
    user_keystroke = gets
    press_enter_to_continue(user_keystroke)
  end

  def press_enter_to_continue(user_keystroke)
    if user_keystroke != "\n"
      p "Please press enter."
      user_keystroke = gets
      press_enter_to_continue(user_keystroke)
    else
      display_welcome_screen
    end
  end

  def quit_program
    Kernel.exit
  end

  def welcome_screen_selection
    starting_choice = display_welcome_screen
    if starting_choice == 'q' || starting_choice == 'quit'
      quit_program
    elsif starting_choice == 'i' || starting_choice == 'instructions'
      display_game_instructions
    elsif starting_choice = 'p' || starting_choice == 'play'
      play_game
    else
      display_welcome_screen
    end
  end

  def choose_ship_placement
    p "Please enter the first and last coordinate of your ship."
    coordinates = gets.chomp
  end

  def invalid_ship_placement_message
    p "Your coordinates are invalid. Please enter valid coordinates."
    coordinates = gets.chomp

  end

  def enter_shot_coordinate
    p "Fire away! Please enter the coordinate."
    shot_coordinate = gets.chomp
  end

  def hit_message
    p "That's a hit!"
  end

  def miss_message
    p "That's a miss."
  end

  def player_won
    p "You're the 'bomb!' You won! It took you #{whatever} shots and #{whatever}" time to finish the game!
  end

  def player_lost
    p "Sorry, this time you're sunk. It took the computer #{whatever} shots and #{whatever} time to win."
  end


end
