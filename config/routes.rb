Rails.application.routes.draw do
  devise_for :users
  root 'products#index'
  resource :basket, only: %i(show)

  resources :products, only: %i(new show create) do
    scope module: :products do
      resources :add_to_baskets, only: %i(create)
      resources :delete_in_baskets, only: %i(create)
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
