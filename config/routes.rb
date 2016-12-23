Rails.application.routes.draw do
  # get 'product/new'

  # get 'users/new', to: 'users#new', as: :new_user
  # get 'users/:id', to: 'users#show', as: :user
  # post 'users', to: 'users#create'
  # get 'users/:id/edit', to: 'users#edit', as: :edit_user
  # patch 'users/:id', to: 'users#update'
  # delete 'users/:id', to: 'users#destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users do
    resources :products
  end
  resources :profile
  root to: "welcome#index"
end
