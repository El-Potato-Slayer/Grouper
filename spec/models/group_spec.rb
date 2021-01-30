require 'rails_helper'
# require_relative '../support/devise'

RSpec.describe Group, type: :model do
  describe 'validation tests' do
    it 'ensures name is not present' do
      group = Group.new(user_id: 1).save
      expect(group).to eq(false)
    end

    it 'ensures user id is not present' do
      group = Group.new(name: 'test').save
      expect(group).to eq(false)
    end

    it 'ensures all fields are present' do
      # login_user
      # user = FactoryBot.build(:user)
      user = User.new(id: 1, name: 'John', email: 'john@does.com', password: '123456', password_confirmation: '123456').save
      group = Group.new(name: 'Groupname', user_id: 1).save
      expect(group).to eq(true)
    end
  end

  describe 'associations' do
    it 'belongs to one User' do
      relation = described_class.reflect_on_association(:user)
      expect(relation.macro).to eq :belongs_to
    end
    
    it "does not belong to multiple Users" do
      relation = described_class.reflect_on_association(:user)
      expect(relation.macro).not_to eq :has_many
    end
    
    it 'has many Expenses' do
      relation = described_class.reflect_on_association(:expenses)
      expect(relation.macro).to eq :has_many
    end
    
    it "does not have 'has_one' Expense association" do
      relation = described_class.reflect_on_association(:expenses)
      expect(relation.macro).not_to eq :has_one
    end
    
    it 'has many GroupExpenses' do
      relation = described_class.reflect_on_association(:group_expenses)
      expect(relation.macro).to eq :has_many
    end
    
    it "does not have 'has_one' GroupExpenses association" do
      relation = described_class.reflect_on_association(:group_expenses)
      expect(relation.macro).not_to eq :has_one
    end
  end
end
