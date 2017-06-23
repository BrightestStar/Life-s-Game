Rails.application.routes.draw do
  devise_for :users
  root 'objectives#index'

  resources :objectives do
    resources :posts
  end

end
