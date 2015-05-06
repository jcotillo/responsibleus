Rails.application.routes.draw do


devise_for :users, controllers: {registrations: 'users/registrations', :omniauth_callbacks => 'users/omniauth_callbacks'}

resources :coupons
resources :events


devise_scope :user do
get '/auth/google_oauth2/callback' => 'omniauth_callbacks#google_oauth2'
end

  root to: "home#index"
  get '/dash' => 'home#userdash'
  get '/business' => 'home#businessdash'
end
