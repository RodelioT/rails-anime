Rails.application.routes.draw do
  resources :producers
  resources :genres
  resources :animes

  # To make localhost:3000 redirect you to the animes index
  root to: 'animes#index'

  # Routes pages located at localost:3000/pages/xxxxx
  get '/pages/:page' => 'pages#show'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
