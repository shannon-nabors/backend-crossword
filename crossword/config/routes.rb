Rails.application.routes.draw do
  resources :puzzles, only: [:show, :destroy]
  resources :solves, only: [:create]
  resources :users, only: [:create]
  resources :favorites, only: [:create, :destroy]

  get "puzzles/user/:id", to: "puzzles#index"
  get "puzzles", to: "puzzles#anonymous_index"
  get "solves/user/:id", to: "solves#by_user"
  get "solves/puzzle/:id", to: "solves#by_puzzle"
  get "favorites/user/:id", to: "favorites#by_user"
  get "favorites/puzzle/:id", to: "favorites#by_puzzle"
  post "puzzles/create/:number", to: "puzzles#create"
  patch "puzzles/setup/:id", to: "puzzles#setup"
  patch "puzzles/letter/:id", to: "puzzles#letter"
  patch "puzzles/clue/:id", to: "puzzles#clue"
  patch "puzzles/enter/:id", to: "puzzles#enter"
  post "users/login", to: "users#login"
end
