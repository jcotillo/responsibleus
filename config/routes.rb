Rails.application.routes.draw do
  get 'events/show'

  get 'events/new' => 'events#new'
  post 'events/create' => 'events#create'
  
  get 'events/edit'

  get 'events/destroy'

  devise_for :users, controllers: {registrations: 'users/registrations'}
  root to: "home#index"
  get '/dash' => 'events#index'
  get '/business' => 'home#businessdash'
end
