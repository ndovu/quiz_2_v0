Rails.application.routes.draw do
  # root route
  root "welcome#index"

  # User routes
  devise_for :users, controllers: { sessions: "users/sessions" }

  # Idea routes
  resources :ideas do
    resources :comments
  end

  get "/welcome/:name" => "welcome#show", as: :welcome
  get "/welcome/hello" => "welcome#hello", as: :hello_welcome

end
