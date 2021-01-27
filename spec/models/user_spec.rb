require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validation tests' do
    it 'ensures name is not present' do
      user = User.new(email: 'test@test.com', password: '123456', password_confirmation: '123456').save
      expect(user).to eq(false)
    end

    it 'ensures email is not present' do
      user = User.new(name: 'test', password: '123456', password_confirmation: '123456').save
      expect(user).to eq(false)
    end

    it 'ensures password is not present' do
      user = User.new(name: 'test', email: 'test@test.com', password_confirmation: '123456').save
      expect(user).to eq(false)
    end

    it 'ensures password_confirmation is not present' do
      user = User.new(name: 'test', email: 'test@test.com', password: '123456').save
      expect(user).to eq(false)
    end
    
    it 'ensures all fields are not present' do
      user = User.new().save
      expect(user).to eq(false)
    end
    
    it 'ensures all fields are present' do
      user = User.new(name: 'tester', email: 'test@tester.com', password: '123456', password_confirmation: '123456').save
      expect(user).to eq(true)
    end
  end

  describe 'associations' do
    it 'has many Groups' do
      relation = described_class.reflect_on_association(:groups)
      expect(relation.macro).to eq :has_many
    end
    
    it "does not have 'has_one' Group association" do
      relation = described_class.reflect_on_association(:groups)
      expect(relation.macro).not_to eq :has_one
    end

    it 'has many Expenses' do
      relation = described_class.reflect_on_association(:expenses)
      expect(relation.macro).to eq :has_many
    end
    
    it "does not have 'has_one' Expense association" do
      relation = described_class.reflect_on_association(:expenses)
      expect(relation.macro).not_to eq :has_one
    end

  end
end
