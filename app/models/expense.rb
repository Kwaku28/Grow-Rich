class Expense < ApplicationRecord
  # Associations
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :expenditures, dependent: :destroy
  has_many :budgets, through: :expenditures

  # Validations
  validates :name, presence: true, length: { minimum: 3, maximum: 50 }
  validates :amount, presence: true, numericality: { greater_than: 0 }
end
