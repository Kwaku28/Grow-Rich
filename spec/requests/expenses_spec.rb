require 'rails_helper'

RSpec.describe 'Expenses', type: :request do
  include Devise::Test::IntegrationHelpers

  before(:each) do
    @user = User.create!(name: 'Lebron', email: 'kwaku28@gmail.com', password: 'kwaku28',
                         password_confirmation: 'kwaku28')
    @budget = Budget.create!(name: 'Food',
                             icon: 'https://99designs-blog.imgix.net/blog/wp-content/uploads/2017/08/BRAND-YOURSELF-700x420.jpg?auto=format&q=60&fit=max&w=930', author_id: @user.id)
    @expense = Expense.create!(name: 'Pizza', amount: 10, author_id: @user.id)
  end

  describe 'GET /new' do
    it 'returns http success' do
      sign_in @user
      get new_budget_expense_path(@budget)
      expect(response).to have_http_status(:success)
    end
  end
end
