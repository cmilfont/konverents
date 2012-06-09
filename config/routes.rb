Konverents::Application.routes.draw do
  root :to => 'home#index'

  resources :events do
      resources :tracks
  end

end
