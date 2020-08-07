Rails.application.routes.draw do
  devise_for :users
  post 'follow/:id' => 'relationships#follow', as: 'follow'
  post 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow'
  root 'home#top'
  get 'home/about'
  resources :users, only: [:show, :index, :edit, :update] do
    resource :relationships, only: [:create, :destroy]
  	get :follows, on: :member
  	get :followers, on: :member
  end
  resources :books, except: [:new] do
    resources :book_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end
end
