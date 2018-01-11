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
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
