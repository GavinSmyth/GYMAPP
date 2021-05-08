class PersonalTrainerPolicy < ApplicationPolicy
    attr_reader :user, :personal_trainer 
    def initialize(user, personal_trainer)
      @user = user
      @personal_trainer = personal_trainer
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