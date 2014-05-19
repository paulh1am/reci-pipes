Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'




  get 'chefs' => 'chefs#index'
  
  get 'chefs/new' => 'chefs#new'
  post 'chefs' => 'chefs#create'

  get 'chefs/:id/edit' => 'chefs#edit'
  put 'chefs/:id' => 'chefs#update'
  get 'chefs/:id' => 'chefs#show'
  delete 'chefs/:id' => 'chefs#destroy'

#bcrypt session
  get 'sessions/new' => 'sessions#new', as: 'log_in'
  post 'sessions' => 'sessions#create'

  #'sessions/logout' => 'sessions#destroy'
  delete 'sessions' => 'sessions#destroy', as: 'log_out'
  #better way to handle logout route

  get 'profiles' => 'profiles#index'

# yes_sms handles the twilio requests
  get 'yes_sms' => 'yes#index'

  get 'yes_sms/send' => 'yes#sms'

  get 'list' => 'yes#index'
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
