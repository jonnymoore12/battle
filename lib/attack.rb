class Attack

  attr_reader :type

  def initialize(attacker, opponent = nil, attack_type = nil)
    @type = attack_type
    @attacker = attacker
    @opponent = opponent
  end

  def execute
    case type
    when "Attack 1"
      damage = attack_1
    when "Attack 2"
      damage = attack_2
    when "Attack 3"
      damage = attack_3
    else
      damage = attack_2
    end
    @opponent.receive_damage(damage)
  end

  private

  def attack_1
    10
  end

  def attack_2
    20
  end

  def attack_3
    100
  end

end
