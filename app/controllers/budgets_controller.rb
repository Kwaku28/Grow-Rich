class BudgetsController < ApplicationController
  load_and_authorize_resource

  # error handling
  rescue_from ActiveRecord::RecordNotFound do |_exception|
    flash[:alert] = 'The budget you were looking for could not be found.'
    redirect_to root_path
  end

  rescue_from CanCan::AccessDenied do |_exception|
    flash[:alert] = 'You are not authorized to perform this action.'
    redirect_to root_path
  end

  def index
    @user = current_user
    @budgets = @user.budgets.where(author_id: current_user.id).order('created_at DESC')
  end

  def show
    @budget = current_user.budgets.includes(:expenses).find(params[:id])
    @expenses = @budget.expenses
    @total = calulate_total(@expenses)
  end

  def new
    @budget = Budget.new
  end

  def create
    @budget = current_user.budgets.build(budget_params)
    if @budget.save
      flash[:notice] = 'Budget was created successfully.'
      redirect_to @budget
    else
      render 'new'
    end
  end

  private

  def budget_params
    params.require(:budget).permit(:name, :icon)
  end

  def calulate_total(expenses)
    total = 0
    expenses.each do |expense|
      total += expense.amount
    end
    total
  end
end
