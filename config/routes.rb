Rails.application.routes.draw do
  root 'homes#top'
  get 'homes/about' => 'homes#about'
  devise_for :users
  resources :posts, only: [:create, :index, :show, :edit, :update, :destroy] do
  	resources :comments, only: [:create, :destroy]
  	resources :favorites, only: [:create, :destroy]
  end
  resources :users, only: [:show, :edit, :update] do
  		get 'follows' => 'relationships#follower', as: 'follows'
  		get 'followers' => 'relationships#followed', as: 'followers'
  end
  resources :relationships, only: [:create, :destroy]

  get 'search' => 'searches#search'
end
