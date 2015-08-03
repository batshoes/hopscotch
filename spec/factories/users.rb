FactoryGirl.define do
  factory :user do
    username 'hopscotch'
    
  sequence :email do |n|
    "genericemail#{n}@gmail.com"
  end

    password '12345678'
  end
end