class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.is_admin?
      can :manage, :all
    else
      can :read, User
      can :manage, Post
    end
  end
end
