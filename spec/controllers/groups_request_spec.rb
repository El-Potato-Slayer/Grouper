require 'rails_helper'
require_relative '../support/devise'

RSpec.describe GroupsController, type: :controller do
  # user = FactoryBot.create(:user)
  
  describe "GET #index" do
    # login_as(user, :scope => :user)
    login_user
    it "returns a success response" do
      get :index
      expect(response).to be_successful
    end
  end
end
