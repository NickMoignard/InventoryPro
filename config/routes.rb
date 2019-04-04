Rails.application.routes.draw do
  resources :product_sizes
  resources :stocks
  resources :products
  resources :variants do
    collection do
      put '/bulk_update' => 'variants#bulk_update' # variants: [{variant_id: 123, quantity: 25, }, ]
    end
  end
  root :to => 'products#index'

  get :search, controller: :products 

  mount ShopifyApp::Engine, at: '/'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
