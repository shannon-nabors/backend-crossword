Rails.application.routes.draw do
  resources :puzzles, only: [:destroy]
  resources :solves, only: [:index, :create]
  # get "puzzles/:id/cells", to: "puzzles#cells"
  get "puzzles/user/:id", to: "puzzles#index"
  post "puzzles/create/:number", to: "puzzles#create"
  patch "puzzles/setup/:id", to: "puzzles#setup"
  patch "puzzles/enter/:id", to: "puzzles#enter"
end
