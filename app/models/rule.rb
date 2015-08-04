class Rule < ActiveRecord::Base
  belongs_to :game

  validates_presence_of :drink, :rules 
end
