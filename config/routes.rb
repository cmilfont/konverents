Konverents::Application.routes.draw do
  
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" } do
    get "sign_in",  :to => "devise/sessions#new", :as => :login
    get "sign_up",  :to => "devise/registrations#new"
    get "sign_out", :to => "devise/sessions#destroy", :as => :logout  
  end

  # devise_scope :user do
  #   get '/users/auth/facebook' => 'users/omniauth_callbacks#passthru'
  #   get '/users/auth/facebook/callback' => 'users/omniauth_callbacks#passthru'
  # end

  root :to => 'home#index'

  resources :events do
      resources :tracks
  end

end
