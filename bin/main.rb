#!/usr/bin/env ruby

the_board = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]

def print_board(board)
  puts ''
  (0..2).each do |row|
    print '|'
    (0..2).each do |col|
      print board[row][col]
      print '|'
    end
    puts ''
  end
  puts ''
end

def user_input
  x = gets.chomp
  if ('1'..'9').cover? x
    x = x.to_i
    puts "Now, your move is displayed on the board in position #{x}"
  else
    puts x
    puts 'Try again!!!'
  end
  x
end

game_over = false

wins = false

draws = false

until game_over
  game_over = true if wins || draws

  puts print_board(the_board)
  puts 'Player X : Type a number from 1 to 9'
  user_input
  puts 'Player O : Type a number from 1 to 9'
  user_input
  puts 'Player X : Type a number from 1 to 9'
  user_input
  puts 'Player O : Type a number from 1 to 9'
  user_input
  puts 'Player X Wins!'
  game_over = true
end
