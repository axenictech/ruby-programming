Rails.application.routes.draw do
  root 'subjects#index'
  get 'subjects/index'

  get 'subjects/insert_batch'
  post 'subjects/batch_save'
  delete 'subjects/batch_delete'
  get 'subjects/update_batch'
  patch 'subjects/batch_update'
  
  get 'subjects/subject'
  
  get 'subjects/insert_normal'
  get 'subjects/insert_elective'
  post 'subjects/normal_save'
  post 'subjects/elective_save'
  get 'subjects/showne'
  delete 'subjects/normal_delete'
  get 'subjects/update_normal'
  patch 'subjects/normal_update'

  delete 'subjects/elective_delete'
  get 'subjects/update_elective'
  patch 'subjects/elective_update'

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
