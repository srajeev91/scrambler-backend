Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: [:index, :show, :create]
      resources :words, only: [:index]
      resources :games, only: [:index, :create]

      get '/users/:user_id/games', to: 'users#users_games'
      
      #This is login
      resources :sessions, only: [:create]

    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
