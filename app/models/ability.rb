class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # Guest user (not logged in)

    if user.admin?
      can :manage, :all # Admin has full access to all resources
    else
      can :read, Post # Regular users can read posts
      can :create, Post # Regular users can create new posts
      can :manage, Post, user_id: user.id # Regular users can manage their own posts
    end
  end
end
