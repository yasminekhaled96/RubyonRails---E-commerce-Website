# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
   
    user ||= User.new # guest user (not logged in)
    if user.seller_role?
      can :manage, :all
    end
    if user.buyer_role?
      # can :read, :all
      can [:read, :filter, :search],Product      
      can :create, Order, user_id: user.id
      # can :manage, User
    end
  end
end
