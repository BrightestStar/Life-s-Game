Rails.application.routes.draw do
  root 'objectives#index'

  resources :objectives do
    resources :posts
  end

end
