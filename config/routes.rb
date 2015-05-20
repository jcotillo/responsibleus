Rails.application.routes.draw do
  get 'greenpoints/new'
  post 'greenpoints/create' 
  get 'greenpoints/edit'
  post 'greenpoints/update'

devise_for :users, controllers: {registrations: 'users/registrations', :omniauth_callbacks => 'users/omniauth_callbacks'}

resources :coupons
resources :events

get 'publicevents' => 'events#publicevents'
get 'confirmed/:id' => 'events#confirmed'
post 'eventships/:id' => 'events#eventships'


devise_scope :user do
post '/auth/google_oauth2/callback' => 'omniauth_callbacks#google_oauth2'
end

  root to: "home#index"
  get '/dash' => 'home#userdash'
  get '/business' => 'home#businessdash'
end
