require_relative 'lib/board'

board = [
  [1, 2, 3], 
  [4, 5, 6], 
  [7, 8, 9]
]

coords = {
  1 => [0, 0],
  2 => [0, 1],
  3 => [0, 2],
  4 => [1, 0],
  5 => [1, 1],
  6 => [1, 2],
  7 => [2, 0],
  8 => [2, 1],
  9 => [2, 2]
}

valid_squares = [1,2,3,4,5,6,7,8,9]

round = 1

player_one = false
player_two = false

draw_board(board)
puts "tic tac toe each player must choose a number between 1 and 9  "

while round <= 9
  if round.odd?
    print "player one's turn: "
    choice = gets.chomp
    if valid_squares.include?(choice.to_i)
      valid_squares.delete(choice.to_i)
      row, col = coords[choice.to_i]
      board[row][col] = "x"
      round += 1
    else
      puts "invalid input"
    end
  elsif round.even?
    print "player two's turn: "
    choice = gets.chomp
    if valid_squares.include?(choice.to_i)
      valid_squares.delete(choice.to_i)
      row, col = coords[choice.to_i]
      board[row][col] = "o"
      round += 1
    else
      puts "invalid input"
    end
  end
  draw_board(board)

  board.each do |row|
    if row.all? {|elem| elem =="x"}
      player_one = true
    elsif row.all? {|elem| elem =="o"}
      player_two = true
    end
  end

  for i in 0..2
    if [board[0][i], board[1][i], board[2][i]].all? {|x| x == "x"}
      player_one = true
    elsif [board[0][i], board[1][i], board[2][i]].all? {|x| x == "x"}
      player_two = true
    end
  end

  if [board[0][0], board[1][1], board[2][2]].all? {|x| x == "x"}
    player_one = true
  elsif [board[0][0], board[1][1], board[2][2]].all? {|x| x == "o"}
    player_two = true
  end
    
  if [board[0][2], board[1][1], board[2][0]].all? {|x| x == "x"}
    player_one = true
  elsif [board[0][2], board[1][1], board[2][0]].all? {|x| x == "o"}
    player_two = true
  end
  
  if player_one
    puts'player one wins'
    break
  elsif player_two
    puts'player two wins'
    break
  end
end
