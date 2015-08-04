require 'rails_helper'

RSpec.describe UsersController, :type => :controller do

  let(:test_user) {create(:user)}

  describe "GET #index" do
    it "Should respond success" do
      get :index
      expect(response).to have_http_status(:success)
    end

  end


  describe "GET #show" do
    it "Should respond success" do
      get :show, id: test_user.id
      expect(response).to have_http_status(:success)
    end
  end




end