class ExpensesController < ApplicationController
  before_action :authenticate_user!

  rescue_from ActiveRecord::RecordNotFound do |_exception|
    flash[:alert] = 'The expense you were looking for could not be found.'
    redirect_to root_path
  end

  before_action :authorize_budget, only: %i[new create]

  def new
    @expense = Expense.new
    @budgets = Budget.where(author_id: current_user.id)
  end

  def create
    @expense = Expense.new(expense_params)
    @expense.author_id = current_user.id

    if params[:expense][:selected_ids].present?
      if save_expense_and_expenditures
        redirect_to budget_path(params[:budget_id])
      else
        render :new, status: :unprocessable_entity
      end
    else
      redirect_to budget_expenses_path(params[:budget_id]), alert: 'Please select at least one checkbox.'
    end
  end

  private

  def authorize_budget
    return if current_user.id.to_i == Budget.find(params[:budget_id]).author_id.to_i

    redirect_to root_path
  end

  def save_expense_and_expenditures
    ActiveRecord::Base.transaction do
      @expense.save!
      params[:expense][:selected_ids].each do |id|
        Expenditure.create!(expense_id: @expense.id, budget_id: id.to_i)
      end
    end
    true
  rescue ActiveRecord::RecordInvalid
    false
  end

  def expense_params
    params.require(:expense).permit(:name, :amount)
  end

  def selection_params
    params.require(:expense).permit(selected_ids: [])
  end
end
