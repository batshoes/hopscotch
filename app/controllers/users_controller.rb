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

  def update

    @user = User.find params[:id]

    p = user_params

    if user_params[:password].blank?
      p.delete(:password)
      p.delete(:password_confirmation)
    end

    @user.update! p

    flash[:notice] = "Successful update"
    redirect_to user_path(@user)
  end

  def destroy
    @user = User.find params[:id]
    @user.destroy!
    session.clear
    flash[:notice] = "Bye."
    redirect_to root_path
  end

  
  private

  def user_params
    params.require(:user).permit(:username,
                                 :password,
                                 :email,
                                 :password_confirmation)
  end

end
