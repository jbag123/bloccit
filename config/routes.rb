Rails.application.routes.draw do
  resources :topics do
    resources :posts, except: [:index]
  end

  resources :users, only: [:new, :create] do
    post :confirmation, on: :collection
  end

  resources :sessions, only: [:new, :create, :destroy]

  get 'about' => "welcome#about"

  root 'welcome#index'
end
