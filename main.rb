require "./game.rb"
require "./player.rb"
require "./question.rb"

puts "Let's start the simple math game!"

new_game = Game.new
player_1 = Player.new('Player 1')
player_2 = Player.new('Player 2')

while new_game.game_status
  current_player = new_game.turn_tracker == "player1" ? player_1 : player_2

  question = Question.new
  puts "#{current_player.name}: #{question.ask_question}"

  print ">"

  answer = $stdin.gets.chomp().to_i

  if answer == question.answer
    puts "#{current_player.name}: YES! You are correct."
    new_game.change_player_turn
  else
    puts "#{current_player.name}: Seriously? No!"
    if new_game.turn_tracker == "player1"
      player_1.decrease_lives
    else
      player_2.decrease_lives
    end
    new_game.change_player_turn
  end

  new_game.score_broadcast(player_1, player_2)

  if player_1.lives == 0
    puts "#{player_2.name} wins with a score of #{player_2.lives}/3"
    new_game.end_game
  elsif player_2.lives == 0
    puts "#{player_1.name} wins with a score of #{player_1.lives}/3"
    new_game.end_game
  end
end