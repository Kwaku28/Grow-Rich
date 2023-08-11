class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the user here.

    user ||= User.new # guest user (not logged in)

    # logged in users can manage their own budgets and expenses
    can :manage, Budget, author_id: user.id
    can :manage, Expense, author_id: user.id
  end
end
