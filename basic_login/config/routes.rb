Rails.application.routes.draw do
  resources :users, only: [:show]
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
end
