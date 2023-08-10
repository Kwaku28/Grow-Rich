class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Associations
  has_many :budgets, foreign_key: :author_id, dependent: :destroy
  has_many :expenses, foreign_key: :author_id, dependent: :destroy

  # Validations
  validates :name, presence: true, length: { maximum: 50 }
end
