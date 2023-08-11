require 'rails_helper'

RSpec.describe Expense, type: :model do
  before :all do
    @user = User.create!(name: 'Lebron', email: 'kwaku28@gmail', password: 'kwaku28', password_confirmation: 'kwaku28')
    @budget = Budget.create!(name: 'Food',
                             icon: 'https://99designs-blog.imgix.net/blog/wp-content/uploads/2017/08/BRAND-YOURSELF-700x420.jpg?auto=format&q=60&fit=max&w=930',
                             author_id: @user.id)
    @expense = Expense.create!(name: 'Pizza', amount: 10, author_id: @user.id)
  end

  context 'When creating a new expense' do
    it 'is valid with valid attributes' do
      expect(@expense).to be_valid
    end

    it 'is not valid without a name' do
      @expense.name = nil
      expect(@expense).not_to be_valid
    end

    it 'is not valid without an amount' do
      @expense.amount = nil
      expect(@expense).not_to be_valid
    end

    it 'is not valid without a user' do
      @expense.author_id = nil
      expect(@expense).not_to be_valid
    end
  end
end
