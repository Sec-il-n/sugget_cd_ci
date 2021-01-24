Rails.application.routes.draw do
  get 'users/show'
  root to: 'suggests#index'

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  resources :users, only:[:show]
  namespace :admin do
    resources :users#, only:[:edit, :update, :destroy]
  end

  resources :suggests do
    resources :comments, only:[:create, :edit, :update, :destroy]
  end

  resources :rooms do
    collection do
      get :top
    end
    resources :messages
  end

  resources :suggests_tags, only:[:new, :create, :destroy]

  resources :corporations do
    collection do
      get :select
      post :selected
    end
  end

  resources :proprietorships
  resources :participants, only:[:create, :index, :destroy]

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
