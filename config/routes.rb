Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: 'users/registrations'}
  root to: "home#index"
  get '/dash' => 'home#userdash'
  get '/business' => 'home#businessdash'
end
