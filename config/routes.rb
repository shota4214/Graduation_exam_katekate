Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  root 'articles#index'
  devise_for :users, controllers: {
    registrations: "users/registrations"
  }
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
    post 'users/admin_guest_sign_in', to: 'users/sessions#admin_guest_sign_in'
  end
  resources :users, only: [:show, :index, :update] do
    member do
      get :follow_index
      get :edit_step1
      post :edit_step2
      post :edit_step3
      post :edit_step4
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