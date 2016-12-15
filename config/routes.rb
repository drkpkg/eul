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
    resources :packages
    resources :receivers
    resources :containers
    resources :courses
    resources :offices
  end

  scope :api do
    scope :receivers do
      get 'new' => 'receivers#new_remote', as: :receivers_new_remote
      post 'create' => 'receivers#create_remote', as: :receivers_create_remote
    end

    scope :packages do
      get ':code' => 'api#package_info'
      post 'calculate' => 'packages#calculate'
      post 'checking' => 'packages#checking', as: :checking_package
    end

    scope :geo do
      get 'calculate' => 'api#calculate_minor_distance'
    end

    scope :offices do
      get '/' => 'api#offices'
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
