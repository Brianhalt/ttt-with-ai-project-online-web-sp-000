class Board
  attr_accessor :cells

  def initialize
    reset!
  end

def reset!
  @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
end

def display
  puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
  puts "-----------"
  puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
  puts "-----------"
  puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
end

def position(input)
  input = input.to_i
  cells[input - 1]
end

def update(input, player)
    input = input.to_i
    cells[input -1] = player.token
end

def full?
  cells.all? {|cell| cell == "X" || cell == "O"}
end

def turn_count
  number = 0
  cells.each do |position|  #itterating thru board in a loop checking for X and O
    if position == "X" || position == "O"
    number += 1
    end
  end
  return number
end

def taken?(input)
  if position(input) == " "
    false
  elsif position(input) == ""
    false
  elsif position(input) == nil
    false
  else position(input) == "X" || "O"
    true
  end
end

def valid_move?(input)
  input = input.to_i
  if taken?(input) == false && input.between?(1,9)
      true
  else
      false
  end
end


end
