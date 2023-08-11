require 'rails_helper'

RSpec.describe User, type: :model do
  before :all do
    @user = User.create(name: 'Lebron', email: 'kwaku28@gmail.com', password: '123456', password_confirmation: '123456')
  end

  context 'When creating a new user' do
    it 'is valid with valid attributes' do
      expect(@user).to be_valid
    end

    it 'is not valid without a name' do
      @user.name = nil
      expect(@user).not_to be_valid
    end

    it 'is not valid without an email' do
      @user.email = nil
      expect(@user).not_to be_valid
    end

    it 'is not valid without a password' do
      @user.password = nil
      expect(@user).not_to be_valid
    end
  end
end
