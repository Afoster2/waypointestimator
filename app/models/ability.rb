class Ability
  include CanCan::Ability

  def initialize(user)
    if user.has_role? :admin
      can :manage, :all
    else
      can :read, :all
      can :create, Estimate
      can :update, Estimate, user_id: user.id
      can :destroy, Estimate, user_id: user.id
    end
  end
end
