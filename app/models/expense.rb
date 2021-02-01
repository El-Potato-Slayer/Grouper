class Expense < ApplicationRecord
  belongs_to :author, class_name: 'User'

  has_many :group_expenses
  has_many :groups, through: :group_expenses

  scope :grouped, -> { includes(:groups).where.not(groups: { id: nil }).order('expenses.created_at DESC') }
  scope :ungrouped, -> { where.missing(:groups).order('expenses.created_at DESC') }

  validates :author_id, presence: true
  validates :name, presence: true
  validates :amount, presence: true, numericality: { only_float: true }
end
