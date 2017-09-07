class UserInteraction

  def display_welcome_screen
    p "Welcome to BATTLESHIP"
    p "Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
    player_choice = gets.chomp.downcase
  end

  def quit_program
    Kernel.exit
  end

  def user_wants_to_quit?(welcome_choice)
    welcome_choice == 'q' || welcome_choice == 'quit'
  end

  def user_wants_instructions?(welcome_choice)
    welcome_choice == 'i' || welcome_choice == 'instructions'
  end

  def user_is_ready_to_play?(welcome_choice)
    welcome_choice = 'p' || welcome_choice == 'play'
  end

  def choose_two_unit_ship
    p "I have laid out my ships on the grid."
    p "You now need to layout your two ships."
    p "The first is two units long and the second is three units long."
    p "The grid has A1 at the top left and D4 at the bottom right."
    p "Enter the squares for the two-unit ship:"

    coordinates = gets.chomp
  end

  def choose_three_unit_ship
    p "Now enter the first and last coordinates for your three-unit ship."

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

  def invalid_shot_message
    p "Sorry, you already shot at that space."
  end

  def hit_message
    p "That's a hit!"
  end

  def miss_message
    p "That's a miss."
  end

  def two_ship_sunk_message
    p "The two-unit ship has been sunk!"
  end

  def three_ship_sunk_message
    p "The three-unit ship has been sunk!"
  end

  def player_won
    p "You're the 'bomb!' You won! It took you 10 shots and 1 min time to finish the game!"
  end

  def player_lost
    p "Sorry, this time you're sunk. It took the computer 10 shots and 1 min time to win."
  end


end
