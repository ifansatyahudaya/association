Rails.application.routes.draw do
  # get 'product/new'

  # get 'users/new', to: 'users#new', as: :new_user
  # get 'users/:id', to: 'users#show', as: :user
  # post 'users', to: 'users#create'
  # get 'users/:id/edit', to: 'users#edit', as: :edit_user
  # patch 'users/:id', to: 'users#update'
  # delete 'users/:id', to: 'users#destroy'

  # costume routes
  # resources :users do
  #   member do
  #     delete 'delete_all', to: 'users#delete_all'
  #   end

  #   collection do
  #     post 'like', to: 'users#like'
  #   end

  #   resources :products
  # end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users do
    resources :products, except: :index
    resource :profile, controller: 'profile'
  end

  resources :categories do
    resources :products, only: :index
  end
  resources :products, only: :index
  root to: "welcome#index"
end
