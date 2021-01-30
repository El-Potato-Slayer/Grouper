require 'rails_helper'
require_relative '../support/devise'

RSpec.describe GroupsController, type: :controller do
  login_user
  
  # let(:valid_attributes) {
  #   { :name => "Test title" }
  # }

  # let(:valid_session) { {} }

  # describe "GET #index" do
  #   it 'returns a success response' do
  #     Group.create! valid_attributes
  #     get :index, params: {}, session: valid_session
  #     expect(response).to be_successful
  #   end
  # end

  describe "GET #index" do
    # login_user
    
    it "returns a success response" do
      get :index
      expect(response).to be_successful
    end
  end
end
