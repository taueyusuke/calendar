Rails.application.routes.draw do
  devise_for :users, :controllers => {
  :registrations => 'users/registrations'
  }
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'conferencerooms#index'
  get '/shcedules', to: 'scheduls#index'
  get '/users/:id', to: 'users#show', as: 'user'
  get '/conferencerooms', to: 'conferencerooms#show'
  get '/conferencerooms/:id', to: 'conferencerooms#show', as: 'conferenceroom'
  resources :conferencerooms do
   resources :users, only: %i(new create)
   resources :schedules
  end
end

