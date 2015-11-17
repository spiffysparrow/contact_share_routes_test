Rails.application.routes.draw do
  # get 'users', to: 'users#index'
  # post 'users', to: 'users#create'
  # get 'users/:id', to: 'users#show'
  # get 'users/new', to: 'users#new'
  # get 'users/:id/edit', to: 'users#edit'
  # patch 'users/:id', to: 'users#update'
  # put 'users/:id', to: 'users#update'
  # delete 'users/:id', to: 'users#destroy'

  resources :users do
    resources :contacts, only: [:index]
  end

  resources :contacts, only: [:show, :create, :destroy, :update]

  resources :contact_shares, only: [:create, :destroy]

end
