class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the user here.

    user ||= User.new # guest user (not logged in)

    can manage, :all, user.id
  end
end
