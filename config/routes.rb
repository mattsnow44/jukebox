Rails.application.routes.draw do
  get 'albums/title_sort', to: 'albums#title_sort'
  get 'albums/artist_sort', to: 'albums#artist_sort'
  get 'albums/year_sort', to: 'albums#year_sort'
  get 'albums/genre_sort', to: 'albums#genre_sort'
  get 'tracks/new'

  get 'tracks/edit'

  root 'albums#index'

  resources :albums do
    resources :tracks
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
