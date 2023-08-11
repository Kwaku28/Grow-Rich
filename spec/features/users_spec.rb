require 'rails_helper'

RSpec.describe User, type: :feature do
  describe 'the signup process' do
    it 'should sign up a new user' do
      visit new_user_registration_path
      fill_in 'Name', with: 'Lebron'
      fill_in 'Email', with: 'kwaku28@growrich'
      fill_in 'Password', with: 'kwaku28'
      fill_in 'Password confirmation', with: 'kwaku28'
      click_button 'Sign up'
    end

    it 'should not sign up a new user with invalid credentials' do
      visit new_user_registration_path
      fill_in 'Name', with: 'Lebron'
      fill_in 'Email', with: 'kwaku28@growrich'
      fill_in 'Password', with: 'kwaku28'
      fill_in 'Password confirmation', with: 'kwaku'
      click_button 'Sign up'
    end
  end

  describe 'the login process' do
    it 'should login a user' do
      visit new_user_registration_path
      fill_in 'Name', with: 'Lebron'
      fill_in 'Email', with: 'kwaku777@gmail'
      fill_in 'Password', with: 'kwaku28'
      fill_in 'Password confirmation', with: 'kwaku28'
      click_button 'Sign up'
      visit new_user_session_path
      fill_in 'Email', with: 'kwaku777@gmail'
      fill_in 'Password', with: 'kwaku28'
      click_button 'Log in'
    end
  end
end
