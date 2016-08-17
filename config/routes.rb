Rails.application.routes.draw do
  namespace :admin do
    get 'users/index'
  end

  # get 'reviews/new'

  # get 'reviews/create'

  # get 'sessions/new'

  # get 'sessions/create'

  # get 'users/new'

  # get 'users/create'

  # get 'movies/index'

  # get 'movies/show'

  # get 'movies/new'

  # get 'movies/edit'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :movies do
    resources :reviews, only: [:new, :create]
  end

  resources :users, only: [:new, :create, :show]

  resource :session, only: [:new, :create, :destroy]

  namespace :admin do
    resources :users
  end
end
