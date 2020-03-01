Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'dashboard', to: 'pages#dashboard'
  resources :bookings, except: :index
  get 'refresh_calendar', to: 'bookings#refresh_calendar'

end
