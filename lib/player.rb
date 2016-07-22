require_relative "game.rb"

class Player

attr_reader :name, :hp

  def initialize(name)
    @name = name
    @hp = 100
  end

  def receive_damage(damage)
    @hp -= damage
  end

private

	def calculate_damage
		Kernel.rand(1..50)
	end


end
