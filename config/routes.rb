Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :geniuses do
    resources :pitches, only: [:show, :index, :new]
  end

  resources :pitches

  get '/angels/signup', to: 'angels#new'
  post '/angels/signup', to: 'angels#new'

  resources :angels do
    resources :investments, only: [:show, :index]
  end

  resources :investments

  get '/auth/:provider/callback', to: 'sessions#create'
  # match '/auth/facebook/callback', to: 'sessions#create_from_provider', via: [:get, :post]

  root to: 'sessions#new'

  get '/login', to: 'sessions#new', as: 'new_session'
  post '/login', to: 'sessions#create', as: 'create_session'

end
