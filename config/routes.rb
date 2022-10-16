Rails.application.routes.draw do
  root to: 'home#index'

  resources :categories, :products, :favorites, :seller
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }

  devise_scope :user do
    get 'sign_in', to: 'devise/sessions#new'
    get 'sign_up', to: 'devise/registrations#new'
    get 'edit', to: 'users#edit'
    get 'profile', to: 'users#edit'
    # get 'address', to: 'address#index'
  end

  devise_scope :address do
    get 'address', to: 'addresses#edit'
  end
  
  resources :users , only: [:index, :show, :edit, :update] do
    resource :addresses
  end
  # authenticated :user do
  #   root to: 'home#index', as: :root_app
  # end
end
