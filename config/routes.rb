Rails.application.routes.draw do
  get 'reports/new'
  get 'reports/index'
  get 'reports/show'
  get 'reports/create'
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks', registrations: "users/registrations" }
  root to: 'books#index'
  resources :books do
    resource :comments, only: %i[create destroy], module: :books
  end
  resources :reports do
    resource :comments, only: %i[create destroy], module: :reports
  end
  resources :users, only: %i[index show] do
    resource :relationships, only: %i[create destroy]
    scope module: :users do
      resources :followings, only: [:index]
      resources :followers, only: [:index]
    end
  end
end
