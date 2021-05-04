# frozen_string_literal: true

require 'rails_helper'

# Test suite for the Item model
RSpec.describe Player, type: :model do
  before { @player = FactoryBot.build(:player) }

  subject { @player }
  it { should respond_to(:name) }
  it { should respond_to(:wins) }
  it { should respond_to(:losses) }
  it { should respond_to(:draws) }
  it { should respond_to(:win_ratio) }
  it { should be_valid }

  describe 'test no name' do
    it 'has no name' do
      FactoryBot.build(:player, name: nil).should_not be_valid
    end
  end

  describe '#win_ratio' do
    it 'win_ratio is less than 1' do
      player = FactoryBot.create(:player, name: 'sam', wins: 2, losses: 2, draws: 0)
      expect(player.win_ratio).to eq(0.5)
    end

    it 'win_ratio is 1' do
      player = FactoryBot.create(:player, name: 'sam', wins: 4, losses: 0, draws: 0)
      expect(player.win_ratio).to eq(1)
    end
  end
end
