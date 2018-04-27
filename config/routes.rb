Rails.application.routes.draw do
  root to: 'static#landing_page'

  resources :ministries
  resources :roles
  resources :users, only: [:index, :show, :create]
  resources :apprentice_relationships
  resources :role_relationships, only: [:new, :create]
  post :search_people, to: "search_people#search", as: :search_people
end
