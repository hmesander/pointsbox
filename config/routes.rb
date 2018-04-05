Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'

  resources :users, only: [:new, :show, :create]
  resources :rewards

  resources :user_rewards, only: [:create]

  namespace :admin do
    resources :rewards, only: [:index, :new, :edit]
    resources :points, only: [:new, :create, :destroy]
    resources :users, only: [:index, :show] do
      resources :points, only: [:create, :destroy]
    end
  end

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
