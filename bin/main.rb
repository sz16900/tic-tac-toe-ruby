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
  xOrO = gets.chomp
  if ('1'..'9').include? xOrO
    xOrO = xOrO.to_i
    puts "Now, your move is displayed on the board in position #{xOrO}"
  else
      puts xOrO
      puts "Try again!!!"
  end
  xOrO
end


puts print_board(the_board)
puts "Player X : Type a number from 1 to 9"
user_input()
puts "Player O : Type a number from 1 to 9"
user_input()
puts "Player X : Type a number from 1 to 9"
user_input()
puts "Player O : Type a number from 1 to 9"
user_input()