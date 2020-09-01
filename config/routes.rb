Rails.application.routes.draw do
  root to: 'pages#home'

  devise_for :users

  # embeds invitation of roommates via devise invitable
  resources :teams, only: [:new, :create]

  resources :chores, only: [:index] do
    member do
      patch :change_status_done
      patch :change_status_uncomplete
    end
  end

  # create is a bulk create (receives an array of taks IDs)
  resources :team_tasks, only: [:new, :create]

  namespace :team do
    # might not be needed, might be implemented in /chores
    resources :chores, only: [:index]
  end
end
