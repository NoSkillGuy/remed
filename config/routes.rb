Rails.application.routes.draw do
  resources :users
  resources :user_medicines, only: [:new, :create]
  resources :user_medicine_timers, only: [:new, :create]
  resources :medicines, only: [:new, :create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
