Rails.application.routes.draw do
  resources :milestones
  resources :teams
  resources :tasks
  resources :projects 

  devise_for :users

  root "home#index"
end
