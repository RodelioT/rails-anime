Rails.application.routes.draw do
  get 'about/index'

  resources :employees
  resources :producers
  resources :genres
  resources :animes
  # resources :about

  # get 'animes', to: 'animes#index', as: 'animes'
  # get 'producers', to: 'producers#index', as: 'producers'
  # get 'genres', to: 'genres#index', as: 'genres'
  get 'search', to: 'search#index', as: 'search'
  get 'about', to: 'about#index', as: 'about'

  # To make localhost:3000 redirect you to the animes index
  root to: 'animes#index'

  # Routes about located at localost:3000/about/xxxxx
  # get '/about/:page' => 'about#show'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
