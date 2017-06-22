Rails.application.routes.draw do
  root 'admin/objectives#index'
  namespace :admin do
    resources :objectives
  end
end
