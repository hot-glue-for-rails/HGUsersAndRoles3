Rails.application.routes.draw do
  devise_for :users
  root to: "welcome#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  namespace :admin do
    resources :users
  end
end
