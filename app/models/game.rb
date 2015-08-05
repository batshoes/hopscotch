class Game < ActiveRecord::Base

  before_save :default_value

  belongs_to :user
  has_many :rules

  has_many :comments, dependent: :destroy

  accepts_nested_attributes_for :rules, allow_destroy: true

  validates_presence_of :title, :description     
  
  

  

  def default_value 
    self.likes ||= 0
  end
  
end
