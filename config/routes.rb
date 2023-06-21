Rails.application.routes.draw do
  get 'posts/index'
  get 'posts/show'
  get 'posts/new'
  get 'posts/edit'
  devise_for :users
  devise_scope :user do
    authenticated :user do
      root 'pages#home', as: :authenticated_root
    end

    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end

  resources :posts
end
