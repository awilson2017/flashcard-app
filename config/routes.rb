Rails.application.routes.draw do
  get 'sessions/new'

  resources :tags
  resources :flashcards
  resources :users

  resources :flashcards do
    get :tags, on: :member  #, shallow: true
  end

  resources :tags do
    get :flashcards, on: :member
  end

  # login/logout resources
  post 'login', to: 'users#login'
  post 'logout', to: 'users#logout', as: 'logout'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
