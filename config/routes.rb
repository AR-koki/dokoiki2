Rails.application.routes.draw do
  root 'homes#top'
  get 'homes/about' => 'homes#about'
  devise_for :users
  resources :posts, only: [:new, :create, :index, :show, :edit, :update, :destroy] do
    resources :comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
    collection do
      get "favorites" => "posts#favorites", as: "favorites_all"
    end
  end
  resources :users, only: [:show, :edit, :update] do
    get 'follows' => 'relationships#follower', as: 'follows'
    get 'followers' => 'relationships#followed', as: 'followers'
  end
  resources :relationships, only: [:create, :destroy]

  get 'search' => 'searches#search'
  get '/users/:id/archives/:yyyymm', to: 'posts#archives', as: :post_archive
end
