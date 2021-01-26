class Group < ApplicationRecord
  # before_destroy :destroy_group_expenses

  belongs_to :user

  has_many :group_expenses, dependent: :destroy
  has_many :expenses, through: :group_expenses

  has_one_attached :image

end
