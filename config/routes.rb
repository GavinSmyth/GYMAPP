Rails.application.routes.draw do
 
  devise_for :admin_users, ActiveAdmin::Devise.config
  
  ActiveAdmin.routes(self) 
  class ActiveAdmin::Devise::SessionsController 
   before_action :auth_user
 def auth_user
  return if current_user.admin == true

    redirect_to home_About_path

  end
end
  resources :measurments
  resources :personal_trainers
  resources :pt_clients
  resources :gym_classes
  devise_for :users, controllers: { registrations: "users/registrations" }
  #get 'home/index'
  get 'home/PersonalTrainer'
  get 'home/About'
  root 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.onrg/routing.html
end
