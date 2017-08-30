Rails.application.routes.draw do

  get 'tracks/new'

  get 'tracks/edit'

  root 'albums#index'

  resources :albums do
    resources :tracks
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
