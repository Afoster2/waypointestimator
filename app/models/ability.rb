class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)

    if user.has_role? :admin
      can :manage, :all
    elsif user.has_role? :salesperson
      can :create, User
      can :create, Estimate
      can :read, User, id: user.id
      can :read, Estimate, user_id: user.id
      can :update, User, id: user.id
      can :update, Estimate, user_id: user.id
    else
      can :read, :all
    end
  end

end
