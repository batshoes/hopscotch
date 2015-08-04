class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find params[:id]
  end

  def destroy
    @user = User.find params[:id]
    @user.destroy!
    session.clear
    flash[:notice] = "Bye."
    redirect_to users_path
  end

  
    

end
