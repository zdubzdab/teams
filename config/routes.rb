Rails.application.routes.draw do
  get 'articles/index'

  devise_for :users, only: [:sessions]
  root 'teams#index'
  resources :teams, except: [:index] do
    resources :team_users
  end
  resources :users
end
