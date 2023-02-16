Rails.application.routes.draw do
  

  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  
  devise_for :users, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  
  #管理者側のルーティング設定
  namespace :admin do
    resources :fish, only: [:index, :new, :create, :show, :edit, :update, :destroy]
    resources :genres, only: [:index, :create, :edit, :update, :destroy]
    resources :users, only: [:index, :show, :edit, :update]
  end
  
  #ユーザ側のルーティング設定
  scope module: :public do
    root to: "homes#top"
    get 'homes/about' => 'homes#about', as: 'about'
    resources :posts, only: [:new, :create, :index, :show, :edit, :update, :destroy] do
      resource :likes, only: [:create, :destroy]
      resources :post_comments, only: [:create, :destroy]
      get :search, on: :collection
    end
    resources :users, only: [:edit, :update, :index, :show]
    resources :fish, only: [:index, :show]
    get 'users/data' => 'users#data'
    get 'users/unsubscribe' => 'users#unsubscribe'
    patch 'users/withdrawal' => 'users#withdrawal'
  end
  
  #ゲストユーザ用のルーティング設定
  devise_scope :user do
    post 'public/guest_sign_in', to: 'public/sessions#guest_sign_in'
  end
end
