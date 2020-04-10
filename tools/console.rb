require 'pry'
require_relative '../lib/tic_tac_toe.rb'

ex_board_1 = ["X", "X", "X", "X", "O", "O", "X", "O", "O"]
game = TicTacToe.new
game.board = ex_board_1

binding.pry 