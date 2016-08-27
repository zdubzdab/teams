Rails.application.routes.draw do
  devise_for :users, only: [:sessions]
  root 'teams#index'
end
