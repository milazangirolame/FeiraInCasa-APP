Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/dashboard', as: 'rails_admin'
  mount Attachinary::Engine => "/attachinary"
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :stores
  resources :products
  resources :carts do
    resources :items, only: [:create, :destroy, :update] do
      collection do
        post :more
        post :less
      end
    end
  end
end
