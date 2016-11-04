Rails.application.routes.draw do

  root 'page#index'
  get 'login' => 'page#login'

  scope :session do
    post 'create' => 'session#create'
    post 'delete' => 'session#delete'
  end

  scope :admin do
    get '/' => 'page#dashboard', as: :dashboard
    resources :users
    resources :user_types
    resources :packages
    resources :receivers
    resources :containers
  end

  scope :api do
    scope :user_types do
      get 'new' => 'user_types#new_remote', as: :user_types_new_remote
      post 'create' => 'user_types#create_remote', as: :user_types_create_remote
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
