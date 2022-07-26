Rails.application.routes.draw do
  mount ActionCable.server => '/cable'
  root to: "homes#top"
  devise_for :users
  resources :users, only: [:show, :edit]
  resources :groups do
    get "join" => "groups#join", as: "join"
    delete "leave" => "groups#leave", as: "leave"
    resources :comments, only: [:create]
  end
  get "search" => "searches#search"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
