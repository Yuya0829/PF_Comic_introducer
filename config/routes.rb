Rails.application.routes.draw do

  root to: "homes#top"
  get "homes/about" => "homes#about", as: "about"


  devise_for :users,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
  }

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
  }


  scope module: :public do
    resources :post_images do
    resources :post_comments, only: [:create, :destroy]
    end

    get 'users/unsubscribe' => 'users#unsubscribe', as: 'confirm_unsubscribe'
    patch 'withdraw' => 'users#withdraw', as: 'withdraw_users'
    put 'withdraw' => 'users#withdraw'
    resources :users

  end

   namespace :admin do
    get '/' => 'homes#top'
    resources :users
    resources :genres
  end


end
