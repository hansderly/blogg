Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get "/posts/new", to: "posts#new", as: :new_post
  post "/posts/create", to: "posts#create", as: :posts
  post "/users/:user_id/posts/:id/like_a_post", to: "likes#like_a_post", as: :like_a_post
  post "/users/:user_id/posts/:id/comment_a_post", to: "comments#comment_a_post", as: :comment_a_post

  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show]
  end

  root 'users#index'
end
