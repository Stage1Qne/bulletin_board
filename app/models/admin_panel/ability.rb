module AdminPanel
  class Ability
    include CanCan::Ability

    def initialize(user)
      user ||= User.new

      can :manage, :all if user.admin?
      can :read, :all if user.moderator?
    end
  end
end
