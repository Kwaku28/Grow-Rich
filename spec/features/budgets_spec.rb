require 'rails_helper'

RSpec.describe 'Budgets', type: :feature do
  # before :all do
  #   @user = User.create!(name: 'Lebron', email: 'amoafo2@gmail', password: 'kwaku28', password_confirmation: 'kwaku28')
  #   @budget = Budget.create!(name: 'Food', icon: 'https://99designs-blog.imgix.net/blog/wp-content/uploads/2017/08/BRAND-YOURSELF-700x420.jpg?auto=format&q=60&fit=max&w=930', author_id: @user.id)
  # end

  describe 'the budget creation process' do
    it 'should create a new budget' do
      visit new_user_registration_path
      fill_in 'Name', with: 'Lebron'
      fill_in 'Email', with: 'kwaku28@gmail'
      fill_in 'Password', with: 'kwaku28'
      fill_in 'Password confirmation', with: 'kwaku28'
      click_button 'Sign up'
      visit new_user_session_path
      fill_in 'Email', with: 'kwaku28@gmail'
      fill_in 'Password', with: 'kwaku28'
      click_button 'Log in'
      visit new_budget_path
      fill_in 'Name', with: 'Food'
      fill_in 'Icon URL', with: 'https://99designs-blog.imgix.net/blog/wp-content/uploads/2017/08/BRAND-YOURSELF-700x420.jpg?auto=format&q=60&fit=max&w=930'
      click_button 'Save'
    end
  end
end
