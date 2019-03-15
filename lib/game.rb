class Game

  attr_accessor :board, :player_1, :player_2, :timer

  WIN_COMBINATIONS = [
    [0,1,2], # Top row
    [3,4,5], # Middle row
    [6,7,8], # Bottom row
    [0,4,8], # Diagonal1
    [6,4,2], # Diagonal2
    [0,3,6], # Left column
    [1,4,7], # Middle column
    [2,5,8]  # Right column
  ]

  def initialize(player_1 = Player::Human.new("X"), player_2 = Player::Human.new("O"), board = Board.new, wargame = false)
      @player_1 = player_1
      @player_2 = player_2
      @board = board
      @wargame = wargame
      @timer = 1.5
    end


  def current_player(board)
    if turn_count(board).even?
      return "X"
    else
      return "O"
    end
  end

  def won?(board)
    WIN_COMBINATIONS.each {|win_combo|
      # win_combo = [3,4,5]
      index_0 = win_combo[0]
      # index_0 = 3
      index_1 = win_combo[1]
      # index_0 = 4
      index_2 = win_combo[2]
      # index_0 = 5

      position_1 = board[index_0]
      #   position_1 = "X" || "O" || ""
      position_2 = board[index_1]
      #  position_2 = "X" || "O" || ""
      position_3 = board[index_2]
      #  position_3 = "X" || "O" || ""

      if position_1 == "X" && position_2 == "X" && position_3 == "X"
        return win_combo
      elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
        return win_combo
      end
    }
    return false
  end

  def start

  end

  def winner(board)
    if won?(board)
      win_combo = won?(board)
      player = board[win_combo[0]]
      return player
    end
  end

  def play(board)
    until over?(board)
      turn(board)
    end
    if won?(board)
      puts "Congratulations #{winner(board)}!"
    elsif draw?(board)
      puts "Cat's Game!"
    end
  end

  def turn(board)
    puts "Please enter 1-9:"
    num = gets.chomp
    index = input_to_index(num)
      if valid_move?(board, index) == true
        move(board, index)
        display_board(board)
      else
        turn(board)
      end
  end

end
