require 'rails_helper'

RSpec.describe OmniauthCallbacksController, type: :request do

def set_omniauth(opts = {})
  default = {:provider => :facebook,
             :uuid     => "1234",
             :facebook => {
                            :email => "foobar@example.com",
                            :gender => "Male",
                            :first_name => "foo",
                            :last_name => "bar"
                          }
            }

  credentials = default.merge(opts)
  provider = credentials[:provider]
  user_hash = credentials[provider]

  OmniAuth.config.test_mode = true

  OmniAuth.config.mock_auth[provider] = {
    'uid' => credentials[:uuid],
    "extra" => {
      "email" => user_hash[:email],
      "first_name" => user_hash[:first_name],
      "last_name" => user_hash[:last_name],
      "gender" => user_hash[:gender]
      }
    }
  
end

def set_invalid_omniauth(opts = {})
  
  credentials = { :provider => :facebook,
                  :invalid  => :invalid_crendentials
                 }.merge(opts)
  
  OmniAuth.config.test_mode = true
  OmniAuth.config.mock_auth[credentials[:provider]] = credentials[:invalid]

end 

describe "GET '/users/auth/facebook'" do

  before(:each) do
    set_omniauth
    request.env["devise.mapping"] = Devise.mappings[:user]
    request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:facebook]

    get '/users/auth/facebook'
    request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:facebook]
  end

  it "should set user_id" do
    expect(session[:user_id]).to eq(User.last.id)
  end

  # it "should redirect to root" do
  #   expect(response).to redirect_to root_path
  # end
end

# describe "GET '/auth/failure'" do

#   it "should redirect to root" do
#     get "/auth/failure"
#     expect(response).to redirect_to root_path
#   end
# end


end
