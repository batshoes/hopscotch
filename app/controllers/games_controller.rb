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
      redirect_to game_path(current_user)
    else
      flash[:alert] = "ERROR ERROR HELP AHHHHH"
      render :new
    end
  end

  def destroy
    @game = Game.find params[:id]
    @game.destroy
    redirect_to games_path
  end

  def edit
    @game = Game.find params[:id]
  end

  def update
    @game = Game.find params[:id]
    # @rules = Rule.find @game.id
    # @game.update! game_params
    
    GameUpdater.new.update(@game, game_params)

    redirect_to games_path
  end


  private
  def game_params
      params.require(:game).permit(:title, :description, :category, :rules_attributes => [:drink, :rules])
    end

end





















