Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  namespace :api, defaults: {format: 'json'} do
    namespace :v1 do
      resources :users, only: :show do
        resources :posts, only: [:index], shallow: true do
          resources :comments, only: [:index, :create]
        end
      end
    end
  end

  get "/posts/new", to: "posts#new", as: :new_post
  post "/posts/create", to: "posts#create", as: :posts
  post "/users/:user_id/posts/:id/like_a_post", to: "likes#like_a_post", as: :like_a_post
  post "/users/:user_id/posts/:id/comment_a_post", to: "comments#comment_a_post", as: :comment_a_post
  delete "/users/:user_id/posts/:id", to: "posts#destroy", as: :delete_post

  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :destroy] do
      resources :comments, only: [:destroy]
    end
  end

  root 'users#index'
end
