Rails.application.routes.draw do
  # root route
  root "welcome#index"

  # User routes
  devise_for :users, controllers: { sessions: "users/sessions" }

  # Idea routes
  resources :ideas do
    resources :comments
    resources :joins, only: [:create, :destroy]
    resources :likes, only: [:create, :destroy]
  end

  resources :joins, only: [:index]
  resources :likes, only: [:index]

  get "/welcome/:name" => "welcome#show", as: :welcome
  get "/welcome/hello" => "welcome#hello", as: :hello_welcome

end
