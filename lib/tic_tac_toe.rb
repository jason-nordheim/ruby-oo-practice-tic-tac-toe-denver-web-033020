class TicTacToe
  attr_accessor :board
  
  WIN_COMBINATIONS = [
    [0,1,2], # top row
    [3,4,5], # middle row 
    [6,7,8], # bottom row 
    [0,3,6], # first column 
    [1,4,7], # second column
    [2,5,8], # third column 
    [0,4,8], # diagonal 1 
    [6,4,2]  # diagonal 2 
  ]

  def initialize
    @board = []
    9.times { @board << " " }
  end  

  def self.WIN_COMBINATIONS
    WIN_COMBINATIONS 
  end 

  # Define a method that prints the current board representation based on the @board instance variable.
  def display_board
    puts "------------"
    puts " #{board[0]} | #{board[1]} | #{board[2]} "
    puts "---|---|---"
    puts " #{board[3]} | #{board[4]} | #{board[5]} " 
    puts "---|---|---"
    puts " #{board[6]} | #{board[7]} | #{board[8]} "
    puts "------------"
  end 

  # Define a method into which we can pass user input (in the form of a string, e.g., "1", "5", etc.)
  # and have it return to us the corresponding index of the @board array. Remember that, from the 
  # player's point of view, the board contains spaces 1-9. But the indices in an array start their 
  # count at 0. If the user inputs 5, your method must correctly translate that from the player's 
  # perspective to the array's — accounting for the fact that @board[5] is not where the user intended 
  # to place their token.
  def input_to_index input 
    input.to_i - 1 
  end 

  # Your #move method must take in two arguments: the index in the @board array that 
  # the player chooses and the player's token (either "X" or "O"). The second argument, 
  # the player's token, should default to "X".
  def move index, player_token="X"
    board[index] = player_token
  end 

  # The #position_taken? method will be responsible for evaluating the user's desired move against 
  # the Tic Tac Toe board and checking to see whether or not that position is already occupied. 
  # Note that this method will be running after #input_to_index, so it will be checking index values. 
  # When it is passed the index value for a prospective move, #position_taken? will check to see if 
  # that position on the @board is vacant or if it contains an "X" or an "O". If the position is free, 
  # the method should return false (i.e., "the position is not taken"); otherwise, it will return true.
  def position_taken? index_position 
    board[index_position] != " "
  end 

  # Build a method valid_move? that accepts a position to check and returns true if the move is valid 
  # and false or nil if not. A valid move means that the submitted position is:
  # 1. Present on the game board.
  # 2. Not already filled with a token.
  def valid_move? index_position 
    index_position < 9 && !position_taken?(index_position)
  end 

  # Build a method #turn to encapsulate the logic of a single complete turn composed of the following 
  # routine:
  # 1. Ask the user for their move by specifying a position between 1-9.
  # 2. Receive the user's input.
  # 3. Translate that input into an index value.
  # 4. If the move is valid, make the move and display the board.
  # 5. If the move is invalid, ask for a new move until a valid move is received.
  def turn 
    player = current_player
    puts "Player '#{player}' enter a move [1-9]"
    input = gets.chomp 
    index = input_to_index(input)
    if valid_move?(index)
      move(index,player)
      display_board
    else 
      turn
    end
  end 


  # This method returns the number of turns that have been played based on the @board variable.
  def turn_count 
    board.select {|x| x != " "}.count 
  end 

  # The #current_player method should use the #turn_count method to determine if it is 
  # "X"'s or "O"'s turn.
  def current_player 
    turn_count % 2 == 0 ? "X" : "O"
  end 

  # Your #won? method should return false/nil if there is no win combination present in the board 
  # and return the winning combination indexes as an array if there is a win. 
  # Use your WIN_COMBINATIONS constant in this method.
  def won?
  end 

  # The #full? method should return true if every element in the board contains either an "X" or an "O".
  def full?
  end 

  # Build a method #draw? that returns true if the board is full and has not been won, 
  # false if the board is won, and false if the board is neither won nor full.
  def draw? 
  end 

  # Build a method #over? that returns true if the board has been won or is full (i.e., is a draw).
  def over?
  end 

  # Given a winning @board, the #winner method should return the token, "X" or "O", that has won the game.
  def winner 
  end 

  # The play method is the main method of the Tic Tac Toe application and is responsible for the game loop.
  # A Tic Tac Toe game must allow players to take turns, checking if the game is over after every turn. 
  # At the conclusion of the game, whether because it was won or ended in a draw, the game should report 
  # to the user the outcome of the game. You can imagine the pseudocode:
  #   until the game is over
  #     take turns
  #   end
  
  #   if the game was won
  #     congratulate the winner
  #   else if the game was a draw
  #     tell the players it ended in a draw
  #   end

  def play 
  end 

end
