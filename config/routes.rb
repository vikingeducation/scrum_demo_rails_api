Rails.application.routes.draw do
  root "posts#index"

  resources :comments, only: [:index]

  resources :posts, only: [:index, :create] do
    resources :comments, only: [:create, :destroy]
  end
end
