Rails.application.routes.draw do
  root 'demo#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # catch all, default route match
  match ':controller(/:action(/:id(.:format)))', :via => :get

end
