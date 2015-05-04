Rails.application.routes.draw do


devise_for :users, controllers: {registrations: 'users/registrations'}, :path => 'accounts'

resources :users do
    resources :coupons
  	resources :events
end




  root to: "home#index"
  get '/dash' => 'home#userdash'
  get '/business' => 'home#businessdash'
end
