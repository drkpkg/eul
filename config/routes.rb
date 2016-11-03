Rails.application.routes.draw do
  root 'page#index'

  resources :users
  resources :user_types

  scope :remote do
    scope :user_types do
      get 'new' => 'user_types#new_remote', as: :user_types_new_remote
      post 'create' => 'user_types#create_remote', as: :user_types_create_remote
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
