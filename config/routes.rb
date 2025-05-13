Rails.application.routes.draw do
  get "home/index"
  resources :milestones
  resources :teams
  resources :tasks
  resources :projects 
  resources :users, only: [:index, :show]


  devise_for :users, path: 'users', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    registration: 'signup'
  },
  controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  root "home#index"
end
