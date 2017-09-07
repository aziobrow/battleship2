require_relative 'game_board'

class DisplayBoard
  attr_reader :board_layout, :row_label, :column_label, :board

    def initialize(board)
      @board_layout = Array.new(4, " ").map{|row| Array.new(4, " ")}
      @row_label = ["A", "B", "C", "D"]
      @column_label = ["1", "2", "3", "4"]
      @board = board
    end

    def render_board
    print "\t"
    print @column_label.join("\t")
    print "\n"
    puts
    @board_layout.each_with_index do |row, index|
      print @row_label[index]
      print "\t"
      print row.join("\t")
      print "\n"
      puts
    end
  end

  def render_shot(coordinate)
    shots = @board.all_shots

    shots.each do |coordinate|
      row = @row_label.index(coordinate[0])
      column = @column_label.index(coordinate[1])

      if @board.winning_positions.include?(coordinate)
        @board_layout[row][column] = 'H'
        render_board
      else
        @board_layout[row][column] = 'M'
        render_board
      end
    end
  end

end
