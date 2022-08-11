Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  root 'articles#index'
  devise_for :users
  resources :users, only: [:show]
  resources :articles do
    resources :likes, only: [:create, :destroy]
    collection do
      post :confirm
    end
  end
  resources :favorites, only: [:create, :destroy, :index]
end