Rails.application.routes.draw do
  resources :puzzles, only: [:index, :show]
  get "puzzles/:id/cells", to: "puzzles#cells"
  post "puzzles/create/:number", to: "puzzles#create"
  patch "puzzles/setup/:id", to: "puzzles#setup"
end
