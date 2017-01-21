require 'rails_helper'

RSpec.describe ItemsController, type: :controller do

  context "user" do
    before do
      @user = FactoryGirl.create(:user)
      sign_in @user
      @item = Item.create!(name: Faker::Lorem.word, user: @user)
    end

    describe "POST create" do
      it "increases the number of items by 1" do
        expect{ post :create, {item: {name: Faker::Lorem.word}}}.to change(Item,:count).by(1)
      end

      it "redirect to the new item" do
        post :create, {item: {name: Faker::Lorem.word}}
        expect(response).to redirect_to user_path(@user)
      end
    end
  end

end
