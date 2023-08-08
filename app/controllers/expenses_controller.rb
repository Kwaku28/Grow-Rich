class ExpensesController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound do |_exception|
    flash[:alert] = 'The expense you were looking for could not be found.'
    redirect_to root_path
  end

  def new
    @expense = Expense.new
  end

  def create
    @budget = Budget.all
    @expense = current_user.expenses.build(expense_params)
    @budget.author = current_user

    if @expense.save
      flash[:notice] = 'Expense was created successfully.'
      redirect_to @expense
    else
      render 'new'
    end
  end

  private

  def expense_params
    params.require(:expense).permit(:name, :amount, budget_id: [])
  end
end
