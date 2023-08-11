require 'rails_helper'

RSpec.describe Budget, type: :model do
  before :all do
    @user = User.create!(name: 'Lebron', email: 'lebron@growrich', password: 'kwaku28',
                         password_confirmation: 'kwaku28')
    @budget = Budget.create!(name: 'Food',
                             icon: 'https://99designs-blog.imgix.net/blog/wp-content/uploads/2017/08/BRAND-YOURSELF-700x420.jpg?auto=format&q=60&fit=max&w=930',
                             author_id: @user.id)
  end

  context 'When creating a new budget' do
    it 'is valid with valid attributes' do
      expect(@budget).to be_valid
    end

    it 'is not valid without a name' do
      @budget.name = nil
      expect(@budget).not_to be_valid
    end

    it 'is not valid without an icon' do
      @budget.icon = nil
      expect(@budget).not_to be_valid
    end

    it 'is not valid without a user' do
      @budget.author_id = nil
      expect(@budget).not_to be_valid
    end
  end
end
