Rails.application.routes.draw do
  resources :tags
  resources :flashcards
  resources :users

  resources :flashcards do
    get :tags, on: :member  #, shallow: true
  end

  resources :tags do
    get :flashcards, on: :member
  end

  # OAuth Github login route
  get '/auth/github', to: 'authentication#github', format: false

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
