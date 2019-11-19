# frozen_string_literal: true

class Ability
  include CanCan::Ability

  attr_reader :user

  def initialize(user)
    @user = user

    if user.is_a?(User)
      user.admin? ? admin_abilities : user_abilities
    else
      guest_abilities
    end
  end

  def guest_abilities
    can :read, :all
    can :react, Portfolio
  end

  def user_abilities
    guest_abilities
  end

  def admin_abilities
    can :manage, :all
  end
end
