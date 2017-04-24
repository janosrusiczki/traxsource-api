Rails.application.routes.draw do
  resources :titles, only: [:index, :show]
end
