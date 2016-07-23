require 'attack'

describe Attack do
  subject(:attack){described_class.new(attacker, opponent, attack_type)}
  let(:attacker){:attacker}
  let(:opponent){:opponent}
  let(:attack_type){:attack_type}

  it 'knows what type of attack it is' do
    expect(subject.type).to be :attack_type
  end
end
