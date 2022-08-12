Rails.application.routes.draw do
  root 'users#new'
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  resources :checks
  resources :users, only: %i(new create show edit update)
  resources :sessions, only: %i(new create destroy)
  resources :favorites, only: %i(index create destroy)
  resources :pictures do
    collection do
      post :confirm
    end
  end
end
