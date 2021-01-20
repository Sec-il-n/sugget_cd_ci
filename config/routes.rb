Rails.application.routes.draw do
  # get 'rooms/index'
  # get 'rooms/create'
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  root to: 'suggests#index'
  resources :suggests
  resources :rooms do
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
#
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
