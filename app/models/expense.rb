class Expense < ApplicationRecord
  belongs_to :author, class_name: "User"

  has_many :group_expenses, dependent: :destroy
  has_many :groups, through: :group_expenses
  accepts_nested_attributes_for :groups, allow_destroy: true
  
  # current_user.expenses.order("created_at DESC").includes(:groups).where.not(:groups => { id: nil })
  scope :grouped, -> { includes(:groups).where.not(:groups => {id: nil}).order("expenses.created_at DESC") }
  scope :ungrouped, -> { includes(:groups).where.missing(:groups).order("expenses.created_at DESC") }
  # scope :grouped, -> { where(id: GroupExpense.where(expense_id: ids).pluck(:expense_id)) }
end
