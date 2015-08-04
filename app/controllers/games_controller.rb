class GamesController < ApplicationController
  def index
    @games = Game.all
  end

  def new 
    @game = Game.new
    @game.rules << Rule.new
  end 

  def show
    @games = Game.where user_id: params[:id]
  end


  def create
    @game = Game.new(game_params)
    @game.user_id = current_user.id
    if @game.valid?
      @game.save
      redirect_to games_path(current_user)
    else
      flash[:alert] = "ERROR ERROR HELP AHHHHH"
      render :new
    end
  end


  private
  def game_params
      params.require(:game).permit(:title, :description, :category, :rules_attributes => [:drink, :rules])
    end

end
