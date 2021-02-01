require 'rails_helper'
require_relative '../support/devise'

RSpec.feature 'Groups', type: :feature do
  describe 'create new Group' do
    scenario 'should be successful' do
      user = FactoryBot.create(:user)
      login_as(user, scope: :user)
      visit new_group_path
      within('form') do
        fill_in 'group_name', with: 'Test'
      end
      click_button 'Submit'
      expect(page).to have_content('Group was successfully created.')
    end

    scenario 'should fail' do
      user = FactoryBot.create(:user)
      login_as(user, scope: :user)
      visit new_group_path
      click_button 'Submit'
      expect(page).to have_content("Name can't be blank")
    end
  end
end
