class GamesController < ApplicationController
  def index
    @game = Game.all
  end

  def new 
    @game = Game.new
  end 

  def create
    @game = Game.new
end
