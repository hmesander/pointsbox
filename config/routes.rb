Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'

  resources :users, only: [:new, :show, :create]

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  namespace :admin do
    resources :rewards
  end

  namespace :admin do
    resources :users do
      resources :points, only: [:create, :destroy]
    end
  end

  resources :rewards

  namespace :admin do
    resources :points
  end

  resources :points
end
