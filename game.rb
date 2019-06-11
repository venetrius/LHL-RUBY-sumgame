puts '------- Welcome ------- '

class Game
  def initialize
    @player1 = Player.new('palyer1')
    @player2 = Player.new('palyer2')
    @active_player = @player1
  end

  def status
    "// Status #{@player1.name} : #{@player1.lives}/3 vs #{@player2.name} : #{@player2.lives}/3 \\\\"
  end

  def round_outcome correct
    if correct
      say "#{@active_player.name} YES! You are correct."
    else
      @active_player.loose_health!
      say "#{@active_player.name}: Seriously? No!"
    end
  end

  def round
    say "----- NEW TURN -----"
    question = Question.get_question
    response = ask "#{@active_player.name}: " + question['question']
    round_outcome question['result'] == response
  end

  def switch_turns
    @active_player = @active_player == @player1 ? @player2 : @player1
  end

  def play
    while @player1.is_alive? and @player2.is_alive?
      say status
      round
      switch_turns
    end
    say "#{@active_player.name} wins with a score of #{@active_player.lives}/3"
  end
end