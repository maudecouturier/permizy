Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'dashboard', to: 'pages#dashboard'
  resources :bookings, except: :index
  get 'refresh_calendar', to: 'bookings#refresh_calendar'
  resources :chatrooms, only: [ :show ] do
    collection do
      get 'find_or_create', to: 'chatrooms#find_or_create'
    end
    resources :messages, only: :create
  end
end
