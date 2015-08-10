class DefaultUser

    attr_accessor :game, :game_params
    attr_accessor :user

  def initialize(user)
      @user = user
    end
  @user = current_user
  @user.game.each do
    user_id = 6
  end


end