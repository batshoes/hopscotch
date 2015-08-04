class GamesController < ApplicationController
  def index
    @games = Game.all
  end

  def new 
    @game = Game.new
    @game.rules << Rule.new
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


  private
  def game_params
      params.require(:game).permit(:title, :description, :rules, :category)
    end

end
