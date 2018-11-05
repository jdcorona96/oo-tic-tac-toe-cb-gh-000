class TicTacToe

  @WIN_COMBINATIONS = [

    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [2,4,6],
    [0,4,8]
  ]

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  def move(index, current_player)
    @board[index] = current_player
  end

  def position_taken?(location)
  @board[location] != " " && board[location] != ""
  end

  def valid_move?(index)
  index.between?(0,8) && !position_taken?(index)
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def input_to_index(user_input)
  user_input.strip.to_i - 1
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      move(index, current_player)
      display_board
    else
      turn
    end
  end

  def won?

  for win_combination in WIN_COMBINATIONS
    # win_combination is a 3 element array of indexes that compose a win, [0,1,2]
    # grab each index from the win_combination that composes a win.
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    position_1 = @board[win_index_1] # load the value of the board at win_index_1
    position_2 = @board[win_index_2] # load the value of the board at win_index_2
    position_3 = @board[win_index_3] # load the value of the board at win_index_3

    if (position_1 == "X" && position_2 == "X" && position_3 == "X") ||
       (position_1 == "O" && position_2 == "O" && position_3 == "O")
      return win_combination # return the win_combination indexes that won.
    end
  end
  false
end

def full?
  @board.all? do |element|
    element == "X" || element == "O"
  end
end

def draw?
  if full? && !won?
    return true
  end
  false
end

def over?

  if won? || full?
    return true
  end
  false
end

def winner
  if won? then
    return @board[won?[0]]
  end
  nil
end


  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def play(board)

    loop do
      turn
      if won? then
        puts "#{winner(board)} has won!"
        break
      elsif draw? then
        puts "Draw"
        break
      end
    end
  end
  
end
