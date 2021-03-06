Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get '/users/:user_id/games', to: 'users#users_games'
      resources :users, only: [:index, :show, :create]
      resources :words, only: [:index, :show]
      resources :games, only: [:index, :create]
      resources :user_games, only: [:index, :update, :create, :show]

      get "/highscores" => "user_games#highscores"

      #This is login
      resources :sessions, only: [:create]
    end
  end
  mount ActionCable.server => '/cable'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
