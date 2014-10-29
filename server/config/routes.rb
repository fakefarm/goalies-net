Rails.application.routes.draw do
  resources :goals, only: [:show, :index]
end
