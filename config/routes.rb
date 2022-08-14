Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  root 'articles#index'
  devise_for :users
  resources :users, only: [:show, :index] do
    member do
      get :follow_index
    end
  end
  resources :articles do
    resources :comments
    resources :likes, only: [:create, :destroy]
    collection do
      post :confirm
      get :rank
      get :search
    end
  end
  resources :favorites, only: [:create, :destroy, :index]
  resources :relationships, only: [:create, :destroy]
  resources :conversations do
    resources :messages
  end
end