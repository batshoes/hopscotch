class Game < ActiveRecord::Base

  before_save :default_value

  belongs_to :user
  has_many :rules
  has_many :comments, dependent: :destroy


  validates_presence_of :title, :description     
  
  accepts_nested_attributes_for :rules

  

  def default_value 
    self.likes ||= 0
  end
  

end
