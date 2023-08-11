require 'rails_helper'

RSpec.describe 'Budgets', type: :request do
  include Devise::Test::IntegrationHelpers

  before(:each) do
    @user = User.create!(name: 'Lebron', email: 'law555@gmail', password: 'kwaku28',
                         password_confirmation: 'kwaku28')
    @budget = Budget.create!(name: 'Food',
                             icon: 'https://99designs-blog.imgix.net/blog/wp-content/uploads/2017/08/BRAND-YOURSELF-700x420.jpg?auto=format&q=60&fit=max&w=930',
                             author_id: @user.id)
  end

  describe 'GET /index' do
    it 'returns http success' do
      sign_in @user
      get budgets_path
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      sign_in @user
      get budget_path(@budget)
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /new' do
    it 'returns http success' do
      sign_in @user
      get new_budget_path
      expect(response).to have_http_status(:success)
    end
  end
end
