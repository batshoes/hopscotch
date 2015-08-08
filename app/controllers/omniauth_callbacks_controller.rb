class OmniauthCallbacksController < Devise:: OmniauthCallbacksController
  def github
    # raise request.env["omniauth.auth"].inspect

    @user = User.find_for_github_oauth(user_params)
    flash[:notice] = "Welcome #{@user.email}"
    sign_in(@user)
    redirect_to root_path
  end
private

def user_params
  request.env["omniauth.auth"].permit!(:provider,:uid,:info,:email)

end

end