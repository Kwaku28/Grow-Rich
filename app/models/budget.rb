class Budget < ApplicationRecord
  # Associations
  belongs_to :author, class_name: 'User', foreign_key: 'user_id'
  has_many :expenditures, dependent: :destroy
  has_many :expenses, through: :expenditures

  # Validations
  validates :name, presence: true, length: { minimum: 3, maximum: 50 }
end
