class Group < ApplicationRecord
  belongs_to :user

  has_many :group_expenses, dependent: :destroy
  has_many :expenses, through: :group_expenses

  has_one_attached :image

  validates :name, presence: true
  validates :user_id, presence: true

  scope :alphabetical, -> { order('name ASC') }
end
