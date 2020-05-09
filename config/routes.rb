Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root 'articles#index'
  resources :articles do
    resources :comments
    resources :tags
  end

  get '*path' => redirect('/')
  
  resources :tags
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
