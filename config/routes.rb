Rails.application.routes.draw do
  root 'homes#top'
  get 'homes/about' => 'homes#about'
  devise_for :users
  resources :posts, only: [:new, :create, :index, :show, :edit, :update, :destroy] do
    resources :comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end
  get "users/:id/favorites" => "users#favorites", as: :favorites_all
  get "users/:id/conquer" => "users#conquer", as: :conquer
  resources :users, only: [:show, :edit, :update] do
    get 'follows' => 'relationships#follower', as: 'follows'
    get 'followers' => 'relationships#followed', as: 'followers'
  end
  resources :relationships, only: [:create, :destroy]

  get 'search' => 'searches#search'
  get 'category_searched' => 'searches#category_searched'
  get 'word_searched' => 'searches#word_searched'
  get 'map_searched/:id' => 'searches#map_searched'
  get '/users/:id/archives/:yyyymm', to: 'users#archives', as: :user_archive
end
