require "rails_helper"

describe GameUpdater do 

  let!(:game){create(:game)}

let!(:games_params) {

  { id: game.id,
    game: {
      title: 
    rule: 'test',
    drink: 'beer'
    } }
}
  describe '#update' do

    it 'adds new questions, based on params that dont match exisitng ones' do


    end
  end

end
 