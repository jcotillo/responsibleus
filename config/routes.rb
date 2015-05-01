Rails.application.routes.draw do

  resources :events

  devise_for :users, controllers: {registrations: 'users/registrations'}
  root to: "home#index"
  get '/dash' => 'home#userdash'
  get '/business' => 'home#businessdash'
end
