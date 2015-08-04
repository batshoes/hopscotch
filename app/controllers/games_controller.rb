class GamesController < ApplicationController
  def index
    @game = Game.all
  end

  def new 
    @game = Game.new
  end 

  def create
    @game = Game.new
    @game.users << current_user

    if @game.valid?
      @game.save
      redirect_to user_path
    else
      flash[:alert] = "ERROR ERROR HELP AHHHHH"
      render :new
    end
  end
end
