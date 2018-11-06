class Game
  attr_reader :turn_tracker, :game_status

  def initialize
    @turn_tracker = "player1"
    @game_status = true
  end

  def change_player_turn
    if @turn_tracker == "player1"
      @turn_tracker = "player2"
    else
      @turn_tracker = "player1"
    end
  end

  def score_broadcast(player1, player2)
    puts "P1: #{player1.lives}/3 vs P2: #{player2.lives}/3"
    puts "----- NEW TURN -----"
  end

  def end_game
    @game_status = false
    puts "-----GAME OVER -----"
    puts "Good bye!"
  end
end
