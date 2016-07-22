require_relative "player.rb"

class Game

  def initialize(player_1, player_2)
    @players = [player_1, player_2]
    @player_turn = player_1
  end

  def self.instance
    @game
  end

  def self.create(player_1, player_2)
    @game = Game.new(player_1, player_2)
  end

  def player_1
    @players.first
  end

  def player_2
    @players.last
  end

  def attack
    opponent_of(player_turn).receive_damage
  end

  def player_turn
    @player_turn
  end

  def opponent_of(attacker)
    @players.find { |opponent| opponent != attacker }
  end

  def switch_turn
    if @player_turn == player_1
      @player_turn = player_2
    else
      @player_turn = player_1
    end
  end

end
