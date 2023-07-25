require 'sidekiq/web'

Rails.application.routes.draw do
  resources :bookings
    authenticate :user, lambda { |u| u.admin? } do
      mount Sidekiq::Web => '/sidekiq'
    end

  devise_for :users, :controllers => {
    omniauth_callbacks: "users/omniauth_callbacks" 
  }
  authenticated :user do
    root to: 'home#dashboard', as: :authenticated_root
    get '/auth/:provider/callback' => 'session#omniauth'
  end
  root to: 'home#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"
end
