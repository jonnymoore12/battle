require "game"
require "player"

describe Game do
  subject(:game){described_class.new(player_1, player_2)}
  subject(:player_1){double :player}
  subject(:player_2){double :player}

  describe '#player1' do
    it 'accepts the first player' do
      expect(game.player_1).to eq player_1
    end
  end

  describe '#player_2' do
    it 'accepts the second player' do
      expect(game.player_2).to eq player_2
    end
  end

  describe '#attack' do
    before { expect(player_2).to receive(:receive_damage) }
    it 'damages the player' do
      game.attack
    end
  end

  describe "#player_turn" do
    it "is initialized as player 1" do
      expect(game.player_turn).to eq player_1
    end
  end

  describe "#opponent_of" do
    it "returns player 2 when player 1 attacks" do
      expect(game.opponent_of(player_1)).to eq player_2
    end
  end

  describe "#switch_turn" do
    it "switches turn to player 2" do
      game.switch_turn
      expect(game.player_turn).to eq player_2
    end
  end

end
