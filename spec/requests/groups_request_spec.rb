require 'rails_helper'

RSpec.describe "Groups", type: :request do
  # login_user
  
  # let(:valid_attributes) {
  #   { :name => "Test title" }
  # }

  # let(:valid_session) { {} }

  describe "GET #index" do
    login_user
    
    it "returns a success response" do
      get :index
      expect(response).to be_successful
    end
  end
end
