class Expenditure < ApplicationRecord
  # Associations
  belongs_to :budget
  belongs_to :expense
end
