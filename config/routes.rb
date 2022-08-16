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


end
