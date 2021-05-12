Rails.application.routes.draw do
  get 'users/index'
  get 'users/show'
  devise_for :users
  resources :users, :only => [:index, :show]
  resources :books
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html  
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
