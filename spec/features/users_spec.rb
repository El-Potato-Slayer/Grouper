require 'rails_helper'

RSpec.feature 'Users', type: :feature do
  describe 'create new User' do
    scenario 'should be successful' do
      user = FactoryBot.create(:user)
      visit new_user_session_path
      within('form') do
        fill_in 'user_email', with: user.email
        fill_in 'user_password', with: user.password
      end
      click_button 'Log in'
      expect(page).to have_content('Signed in successfully.')
    end

    scenario 'should fail if email is incorrect' do
      user = FactoryBot.create(:user)
      visit new_user_session_path
      within('form') do
        fill_in 'user_email', with: ''
        fill_in 'user_password', with: user.password
      end
      click_button 'Log in'
      expect(page).to have_content('Invalid Email or password.')
    end

    scenario 'should fail if email is incorrect' do
      user = FactoryBot.create(:user)
      visit new_user_session_path
      within('form') do
        fill_in 'user_email', with: user.email
        fill_in 'user_password', with: ''
      end
      click_button 'Log in'
      expect(page).to have_content('Invalid Email or password.')
    end

    scenario 'should fail if email and password is incorrect' do
      visit new_user_session_path
      within('form') do
        fill_in 'user_email', with: ''
        fill_in 'user_password', with: ''
      end
      click_button 'Log in'
      expect(page).to have_content('Invalid Email or password.')
    end
  end
end
