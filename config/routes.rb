Rails.application.routes.draw do
  devise_for :users, :controllers => {
  :registrations => 'users/registrations'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'conferencerooms#index'
  
  get '/conferencerooms/:id', to: 'conferencerooms#show', as: 'conferenceroom'
  resources :conferencerooms, only: %i(new create index show) do
  resources :users, only: %i(new create)
    resources :schedules, only: %i(new create)
  end
end
