Rails.application.routes.draw do
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
  
  root 'welcome#index' 
 
  get    'users'       => 'users#fetch_all'
  get    'users/guest' => 'users#fetch_guest'
  get    'users/:id'   => 'users#fetch'
  post   'users'       => 'users#create'
  put    'users/:id'   => 'users#update'
  delete 'users/:id'   => 'users#destroy'
  

  get    'sessions'     => 'sessions#fetch_all'
  get    'sessions/:id' => 'sessions#fetch'
  delete 'sessions/:id' => 'sessions#destroy'

  get    'signup' => 'sessions#signup'
  get    'login'  => 'sessions#login'
  get    'logout' => 'sessions#logout'
  get    'verify' => 'sessions#verify'

  get    'customers'     => 'customers#fetch_all'
  get    'customers/:id' => 'customers#fetch'
  post   'customers'     => 'customers#create'
  put    'customers/:id' => 'customers#update'
  delete 'customers/:id' => 'customers#destroy'

  
  get    'reservations'     => 'reservations#fetch_all'
  get    'reservations/:id' => 'reservations#fetch'
  post   'reservations'     => 'reservations#create'
  put    'reservations/:id' => 'reservations#update'
  delete 'reservations/:id' => 'reservations#destroy'

  get    'options'     => 'options#fetch_all'
  get    'options/:id' => 'options#fetch'
  get    'options/rental/:id' => 'options#fetch_by_rental_id'
  post   'options'     => 'options#create'
  put    'options/:id' => 'options#update'
  delete 'options/:id' => 'options#destroy'
									
  get     'settings' => 'settings#index'
  put     'settings/:section/:name' => 'settings#put'
  get     'settings/:section/:name' => 'settings#get'
  delete  'settings/:section/:name' => 'settings#destroy'
  delete  'settings/:section' => 'settings#destroy_section'
  

  get 'icons' => 'icons#fetch_all'
  get 'icons/tags' => 'icons#fetch_tags'
  
  get    'clients'     => 'clients#fetch_all'
  get    'clients/:id' => 'clients#fetch'
  post   'clients'     => 'clients#create'
  put    'clients/:id' => 'clients#update'
  delete 'clients/:id' => 'clients#destroy'

  get    'categories'     => 'categories#fetch_all'
  get    'categories/:id' => 'categories#fetch'
  post   'categories'     => 'categories#create'
  put    'categories/:id' => 'categories#update'
  delete 'categories/:id' => 'categories#destroy'
  
  get    'rentals'     => 'rentals#fetch_all'
  get    'rentals/:id' => 'rentals#fetch'
  post   'rentals'     => 'rentals#create'
  put    'rentals/:id' => 'rentals#update'
  delete 'rentals/:id' => 'rentals#destroy'
 
 
end
