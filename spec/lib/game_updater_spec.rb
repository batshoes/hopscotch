require 'rails_helper'

describe GameUpdater do
  let!(:game) { create(:game) }

  let!(:game_params) {
    { id: game.id,
      game: {
        title: 'myTitle',
        description: 'Wow',
        rules_attributes: {
          '0' => {
            id: game.rules.first.id,
            rules: 'Rule1',
            drink: 'Beer'

            },
          '1' => {
            rules: 'Rule2',
            drink: 'SHOTZ'
            }
        }
      }
    }
  }

  before do
    @updater = GameUpdater.new(game)
  end

  describe '#update' do
    it "adds new rules, based on params that don't match" do
      changed_game = @updater.update(game_params)
      expect(changed_game.rules.count).to eq(1)
    end
  end
end