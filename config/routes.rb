Rails.application.routes.draw do

  ActiveAdmin.routes(self)
  get 'home/index'

root to: "home#index"

  resources :customers, only: [:show, :edit, :update, :destroy] do
    resources :estimates, only: [:new, :create]
    resources :bookings, only: [:index, :new, :create, :edit, :update, :destroy]
    resources :ratings, only: [:new, :create]
  end

  resources :bricoolers, only: [:index, :show] do
    resources :ratings, only: [:index, :show]
    # resources :services, only: [:index]
    resources :availabilities, only: [:index]
  end

  resources :services, only: [:index] #j'ai créé cette route pour éviter de la lier à un bricooler

  namespace :account do
    resource :profile, only: [:show, :edit, :update, :destroy]
    resources :services, only: [:index, :new, :create, :edit, :update, :destroy]
    resources :bookings, only: [:index]
    resources :availabilities, only: [:index, :new, :create, :edit, :update, :destroy]
  end


  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks', registrations: "users/registrations"}
  # resource :user, only: [:edit] do
  #   collection do
  #     patch 'update_password'
  #   end
  # end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
