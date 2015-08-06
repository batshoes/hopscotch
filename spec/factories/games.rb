FactoryGirl.define do
  factory :game do
    title 'myTitle'
    description 'myDescription'
    likes 100

    # after(:build) do |game, evaluator|
    #   game.users << build(:user)
    # end
    
    after(:build) do |game, evaluator|
      game.rules << build(:rule)
    end
  end
end