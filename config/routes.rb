Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'

  resources :users, only: [:new, :show, :create]
  resources :rewards
  resources :points

  resources :user_rewards

  namespace :admin do
    resources :rewards
    resources :points
    resources :users do
      resources :points, only: [:create, :destroy]
    end
  end

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
