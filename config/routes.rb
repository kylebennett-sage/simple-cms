Rails.application.routes.draw do

  root "public#index"

  resources :subjects do
    member do
      get :delete
    end
    resources :pages do
      member do
        get :delete
      end
      resources :sections do
        member do
          get :delete
        end
      end
    end
  end





  resources :admin_users, except: [:show] do
    member do
    get :delete
    end
  end

  get "show/:permalink", to: "public#show"
  get "admin", to: "access#index"

  # catch all, default route match
  match ":controller(/:action(/:id(.:format)))", via: [:get, :post]
end

