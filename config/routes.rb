Rails.application.routes.draw do
  root to: 'home#index'

  resources :categories, :products
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }

  devise_scope :user do
    get 'sign_in', to: 'devise/sessions#new'
    get 'sign_up', to: 'devise/registrations#new'
    get 'edit', to: 'users#edit'
    get 'address', to: 'address#index'
  end

  devise_scope :address do
    get 'address', to: 'address#index'
    get 'address/new', to: 'address#new'
  end

  resources :users , only: [:index, :show, :edit, :update] do
    resources :address
    # , path_names: { edit: "" }
  end
  # , except: :show,
  # authenticated :user do
  #   root to: 'home#index', as: :root_app
  # end

  # devise_for :users, controllers: {
  #   sessions: 'users/sessions'
  # }

  # devise_scope :user do
  #   root to: 'devise/sessions#new'
  # end
end
