Rails.application.routes.draw do
  devise_for :users
  root 'objectives#index'

  resources :objectives do
    resources :comments
    resources :posts
  end

  get '/about', to: 'pages#about'

end
