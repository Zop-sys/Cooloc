Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
    resources :teams, only: [:create]

    resources :chores, only: [:index, :show]

  resources :tasks, only: [:index, :create]

  namespace :team do
    resources :chores [:index]
  end
end
