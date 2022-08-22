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
    resources :users, only: [:show, :edit, :update, :destroy]
  end

   namespace :admin do
    get '/' => 'homes#top'
    resources :users
  end


end
