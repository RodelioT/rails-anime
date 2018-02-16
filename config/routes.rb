Rails.application.routes.draw do
  resources :genres
  resources :animes

  root to: 'animes#index'
  get "/pages/:page" => "pages#show"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
