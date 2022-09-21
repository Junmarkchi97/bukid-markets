Rails.application.routes.draw do
  devise_for :users
  resources :users , only: [:index, :show, :edit, :update]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: 'home#index'
  # authenticated :user do
  #   root to: 'home#index', as: :root_app
  # end


  # devise_scope :user do
  #   root to: 'devise/sessions#new'
  # end
end
