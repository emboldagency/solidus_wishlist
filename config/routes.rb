Spree::Core::Engine.routes.draw do
  resources :wishlists
  resources :wished_products, only: %i[create update destroy]
  get '/wishlist' => 'wishlists#default', as: 'default_wishlist'
end
