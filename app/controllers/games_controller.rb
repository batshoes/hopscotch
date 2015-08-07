
class GamesController < ApplicationController
  def index
    if params[:user_id].present?
      @games = User.find(params[:user_id]).games
    else
      @games = Game.all
      @answer = params['answer']
    end
  end

  def new 
    @game = Game.new
    @game.rules << Rule.new
  end 

  def show
    @game = Game.find params[:id]
    # @games = Game.where user_id: params[:id]
  end

  def create
    @game = Game.new(game_params)
    @game.user_id = current_user.id
    if @game.valid?
      @game.save
      redirect_to user_games_path(current_user)
    else
      flash[:alert] = "ERROR ERROR HELP AHHHHH"
      render :new
    end
  end

  def destroy
    @game = Game.find params[:id]
    @game.destroy
    redirect_to user_games_path(current_user)
  end

  def edit
    @game = Game.find params[:id]
  end

  def update
    @game = Game.find params[:id]
    GameUpdater.new(@game).update(game_params)
    redirect_to game_path(@game.id)
  end


  private
  def game_params
      params.require(:game).permit(:title, :description, :category, :rules_attributes => [:drink, :rules])
    end

end
