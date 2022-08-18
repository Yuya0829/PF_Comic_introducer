Rails.application.routes.draw do

  scope module: :public do
    resources :post_images, only: [:new, :create, :index, :show, :destroy] do
    resources :post_comments, only: [:create, :destroy]
    end
    resources :users, only: [:show, :edit, :update, :destroy]
  end

  root to: "homes#top"
  get "homes/about" => "homes#about", as: "about"

  devise_for :users,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
  }

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
  }


end
