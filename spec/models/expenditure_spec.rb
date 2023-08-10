require 'rails_helper'

RSpec.describe Expenditure, type: :model do
  before :all do
    @user = User.create!(name: 'Lebron', email: 'amoafo2@gmail', password: 'kwaku28', password_confirmation: 'kwaku28')
    @budget = Budget.create!(name: 'Food',
                             icon: 'https://99designs-blog.imgix.net/blog/wp-content/uploads/2017/08/BRAND-YOURSELF-700x420.jpg?auto=format&q=60&fit=max&w=930', author_id: @user.id)
    @expense = Expense.create!(name: 'Pizza', amount: 10, author_id: @user.id)
    @expenditure = Expenditure.create!(budget_id: @budget.id, expense_id: @expense.id)
  end

  context 'When creating a new expenditure' do
    it 'is valid with valid attributes' do
      expect(@expenditure).to be_valid
    end

    it 'is not valid without a budget' do
      @expenditure.budget_id = nil
      expect(@expenditure).not_to be_valid
    end

    it 'is not valid without an expense' do
      @expenditure.expense_id = nil
      expect(@expenditure).not_to be_valid
    end
  end
end
