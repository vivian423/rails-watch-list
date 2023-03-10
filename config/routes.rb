Rails.application.routes.draw do

  root "lists#index"
  resources :lists, only: [ :new, :create, :show] do
    resources :bookmarks, only: [:new, :create, :destroy]

  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
