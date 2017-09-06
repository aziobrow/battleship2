
class Ships

  attr_reader :validated_coordinates, :game_board, :two_unit_ship, :three_unit_ship

  def initialize(validated_coordinates, game_board = GameBoard.new)
    @validated_coordinates = validated_coordinates
    @game_board = game_board
  end

  def mark_ships
    #require "pry"; binding.pry
    @validated_coordinates.each do |coordinate|
      ship_placement = @game_board.find_game_square(coordinate)
      ship_placement[coordinate] = true
    end
    store_ship_placements
  end

  def store_ship_placements
    if @validated_coordinates.length == 3
      #flatten
      @game_board.three_unit_ship << @validated_coordinates
    else
      @game_board.two_unit_ship << @validated_coordinates
    end
  end

end
