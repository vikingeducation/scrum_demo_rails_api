Rails.application.routes.draw do
  root "posts#index"

  resources :posts, only: [:create] do
    resources :comments, only: [:create, :destroy]
  end
end
