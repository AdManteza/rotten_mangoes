Rails.application.routes.draw do
  # get 'sessions/new'

  # get 'sessions/create'

  # get 'users/new'

  # get 'users/create'

  # get 'movies/index'

  # get 'movies/show'

  # get 'movies/new'

  # get 'movies/edit'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :movies

  resources :users, only: [:new, :create]

  resources :sessions, only: [:new, :create, :destroy]
end
