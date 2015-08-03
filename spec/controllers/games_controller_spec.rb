require 'rails_helper'

RSpec.describe GamesController, :type => :controller do
 let(:test_game) {Game.new( title:'kings',
                            description: 'cards on cards on cards',
                            rules: 'drink all the time',
                            category: 'card',
                            likes: 3
                            )}

  describe "GET #new" do
    it "assigns a new game to @game" do
      get :new
      expect(test_game).to be_an_instance_of Game
    end
  end
   
end