Rails.application.routes.draw do
  devise_for :users
  root 'objectives#index'

  resources :objectives do
    resources :comments
    resources :posts
    get 'award', to: 'objectives#award'
  end

  get '/about', to: 'pages#about'
  get '/pay', to: 'pages#pay'


end
