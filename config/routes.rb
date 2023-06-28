Rails.application.routes.draw do
  get 'users/show'
  devise_for :users
  devise_scope :user do
    authenticated :user do
      root 'pages#home', as: :authenticated_root
    end

    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end

  resources :posts do
    resources :comments, only: [:create]
  end

  post '/toggle_like', to: 'likes#toggle_like', as: :toggle_like
  resources :comments, only: [:destroy]
  resources :users, only: :show

  post 'follow/:user_id', to: 'follows#follow', as: :follow
  delete 'unfollow/:user_id', to: 'follows#unfollow', as: :unfollow
  delete 'cancel_req/:user_id', to: 'follows#cancel_request', as: :cancel_req

  post 'accept_follow/:follow_id', to: 'follows#accept_follow', as: :accept_follow
  delete 'decline_follow/:follow_id', to: 'follows#decline_follow', as: :decline_follow
end
