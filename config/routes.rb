Rails.application.routes.draw do
  root to: 'tops#index'
  post '/suggests/:id', to: 'suggests#update'
  # controllers/usets内のコントローラを割り当てる
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  resources :users, only:[:show]
  namespace :admin do
    resources :users, only:[:index, :edit, :update, :destroy]
  end

  resources :suggests do
    resources :comments, only:[:create, :edit, :update, :destroy]
    # collection do
    #   post :confirm
    # end
  end

  resources :rooms, only:[:index, :create, :show] do
  # resources :rooms, only:[:create, :show] do
    # collection do
    #   get :top
    # end
    resources :messages
  end

  resources :suggests_tags, only:[:new, :create, :destroy, :update]

  resources :corporations do
    collection do
      get :select
      post :selected
    end
  end

  resources :proprietorships
  resources :participants, only:[:create, :index, :destroy]
  resources :contacts, only:[:new, :create]

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  mount ActionCable.server => '/cable'
end
