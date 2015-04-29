Rails.application.routes.draw do
  get 'events/index'

  get 'events/show'

  get 'events/new'

  get 'events/edit'

  get 'events/destroy'

  devise_for :users, controllers: {registrations: 'users/registrations'}
  root to: "home#index"
  get '/dash' => 'home#userdash'
  get '/business' => 'home#businessdash'
end
