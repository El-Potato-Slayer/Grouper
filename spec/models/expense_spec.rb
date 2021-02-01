require 'rails_helper'

RSpec.describe Expense, type: :model do
  describe 'validation tests' do
    it 'ensures Author is not present' do
      expense = Expense.new(name: 'test', amount: 20.5).save
      expect(expense).to eq(false)
    end

    it 'ensures name is not present' do
      expense = Expense.new(author_id: 1, amount: 20.5).save
      expect(expense).to eq(false)
    end

    it 'ensures amount is not present' do
      expense = Expense.new(author_id: 1, name: 'test').save
      expect(expense).to eq(false)
    end

    it 'ensures no fields are present' do
      expense = Expense.new(author_id: 1, name: 'test').save
      expect(expense).to eq(false)
    end

    it 'ensures Expense saves' do
      User.new(id: 1, name: 'john', email: 'john@doe.com', password: '123456',
               password_confirmation: '123456').save
      expense = Expense.new(author_id: 1, name: 'test', amount: 20.5).save
      expect(expense).to eq(true)
    end
  end

  describe 'associations' do
    it 'belongs to one Author' do
      relation = described_class.reflect_on_association(:author)
      expect(relation.macro).to eq :belongs_to
    end

    it 'does not belong to multiple Authors' do
      relation = described_class.reflect_on_association(:author)
      expect(relation.macro).not_to eq :has_many
    end

    it 'has many Groups' do
      relation = described_class.reflect_on_association(:groups)
      expect(relation.macro).to eq :has_many
    end

    it "does not have 'has_one' Group association" do
      relation = described_class.reflect_on_association(:groups)
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
