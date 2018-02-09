Rails.application.routes.draw do
  resources :topics do
    resources :posts, except: [:index]
  end

  resources :users, only: [:new]

  get "users/create"

  post "users/confirmation"

  get 'about' => "welcome#about"

  root 'welcome#index'
end
