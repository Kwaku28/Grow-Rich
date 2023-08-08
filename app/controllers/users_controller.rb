class UsersController < ApplicationController
  def splash
    return unless user_signed_in?
      
      redirect_to budgets_path
  end
end
