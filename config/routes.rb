Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  root to: "home#index"
  get '/dash' => 'home#userdash'
end
