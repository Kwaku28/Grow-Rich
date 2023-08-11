class BudgetsController < ApplicationController
  before_action :authenticate_user!
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
    @budgets = Budget.where(author_id: current_user.id).order('created_at DESC')
  end

  def show
    @budget = Budget.find(params[:id])
    @budget.author_id = current_user.id
    @expenses = @budget.expenses
    @total = calculate_total(@expenses)
  end

  def new
    @budget = Budget.new
  end

  def create
    @budget = Budget.new(budget_params)
    @budget.author_id = current_user.id
    if @budget.save
      flash[:notice] = 'Budget was created successfully.'
      redirect_to budgets_path
    else
      render 'new'
    end
  end

  private

  def budget_params
    params.require(:budget).permit(:name, :icon)
  end

  def calculate_total(expenses)
    total = 0
    expenses.each do |expense|
      total += expense.amount
    end
    total
  end
end
