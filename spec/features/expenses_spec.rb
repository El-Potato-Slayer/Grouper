require 'rails_helper'

RSpec.feature "Expenses", type: :feature do
  describe 'create new Expense' do
    scenario 'should be successful' do
      user = FactoryBot.create(:user)
      login_as(user, :scope => :user)
      visit new_expense_path
      within('form') do
        fill_in 'expense_name', with: 'Test'
        fill_in 'expense_amount', with: '20'
      end
      click_button 'Submit'
      expect(page).to have_content('Expense was successfully created.')
    end

    scenario 'should fail if name is blank' do
      user = FactoryBot.create(:user)
      login_as(user, :scope => :user)
      visit new_expense_path
      within('form') do
        fill_in 'expense_name', with: ''
        fill_in 'expense_amount', with: '20'
      end
      click_button 'Submit'
      expect(page).to have_content("Name can't be blank")
    end
    
    scenario 'should fail if amount is blank' do
      user = FactoryBot.create(:user)
      login_as(user, :scope => :user)
      visit new_expense_path
      within('form') do
        fill_in 'expense_name', with: 'Test'
        fill_in 'expense_amount', with: ''
      end
      click_button 'Submit'
      expect(page).to have_content("Amount can't be blank")
    end

    scenario 'should fail if amount is not a number' do
      user = FactoryBot.create(:user)
      login_as(user, :scope => :user)
      visit new_expense_path
      within('form') do
        fill_in 'expense_name', with: 'Test'
        fill_in 'expense_amount', with: ''
      end
      click_button 'Submit'
      expect(page).to have_content("Amount is not a number")
    end
  end
end
