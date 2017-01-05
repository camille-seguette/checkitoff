require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  before do
    @user = FactoryGirl.create(:user)
    sign_in @user
  end

  describe "GET show" do
    it "renders the show template" do
      get :show, {id: @user.id}
      expect(response).to render_template("show")
    end

    it "returns http success" do
      get :show, {id: @user.id}
      expect(response).to have_http_status(:success)
    end

    it "assigns current_user to @user" do
      get :show, {id: @user.id}
      expect(assigns(:user)).to eq(@user)
    end
  end
end
