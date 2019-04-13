Rails.application.routes.draw do
  resources :puzzles, only: [:destroy]
  resources :solves, only: [:index, :create]
  resources :users, only: [:create]

  get "puzzles/user/:id", to: "puzzles#index"
  post "puzzles/create/:number", to: "puzzles#create"
  patch "puzzles/setup/:id", to: "puzzles#setup"
  patch "puzzles/enter/:id", to: "puzzles#enter"
  post "users/login", to: "users#login"
end
