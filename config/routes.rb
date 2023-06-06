Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get "/posts/new", to: "posts#new", as: :new_post
  post "/posts/create", to: "posts#create", as: :posts
  post "/users/:user_id/posts/:id/add_like", to: "likes#add_like"
  post "/users/:user_id/posts/:id/add_comment", to: "comments#add_comment"

  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show]
  end

  root 'users#index'
end
