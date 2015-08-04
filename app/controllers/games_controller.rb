class GamesController < ApplicationController
  def index
<<<<<<< HEAD
    @games = Game.all
=======
    @game = Game.all
>>>>>>> 0da15d5270aed5498b4c77ff788e4fec32d295c2
  end

  def new 
    @game = Game.new
<<<<<<< HEAD
    @game.rules << Rule.new
  end 

  def create
    @game = Game.new(game_params)
    @game.user_id = current_user.id
    if @game.valid?
      @game.save
      redirect_to '/'
=======
  end 

  def create
    @game = Game.new
    @game.users << current_user

    if @game.valid?
      @game.save
      redirect_to user_path
>>>>>>> 0da15d5270aed5498b4c77ff788e4fec32d295c2
    else
      flash[:alert] = "ERROR ERROR HELP AHHHHH"
      render :new
    end
  end
<<<<<<< HEAD

  private
  def game_params
      params.require(:game).permit(:title, :description, :rules, :category)
    end


=======
>>>>>>> 0da15d5270aed5498b4c77ff788e4fec32d295c2
end
