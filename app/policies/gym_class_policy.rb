class GymClassPolicy < ApplicationPolicy
    attr_reader :user, :gym_class  
    def initialize(user, gym_class)
      @user = user
      @gym_class = gym_class
    end
  
    def create?
      user.try(:admin?)
    end

    def update?
      user.try(:admin?)
    end

    def destroy?
      user.try(:admin?)
    end

    
  
    
  end