Rails.application.routes.draw do
  root to: 'home#index'

  get 'cards/show'

  resources :products
  devise_for :users
  resources :users , only: [:index, :show, :edit, :update]
  resources :shops, only: [:index, :show]
  resources :order_items
  resource :cards, only:[:show]
  resources :order_items

  authenticated :user do
    root to: 'home#index', as: :root_app
  end


  # devise_scope :user do
  #   root to: 'devise/sessions#new'
  # end
end
