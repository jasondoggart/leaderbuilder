Rails.application.routes.draw do
  root to: 'static#landing_page'

  resources :ministries
end
