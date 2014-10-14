Rails.application.routes.draw do
  get 'batches/index'
  root 'batches#index'
  get "batches/createbatch"
   
  get "batches/addnormalsubject", to: "batches#addnormalsubject", as: "addnormalsubject"
  post "batches/savebatch", to: "batches#savebatch", as: "savebatch"
  post "batches/savenormalsubject", to: "batches#savenormalsubject", as: "savenormalsubject"
  
  get "batches/addelectivesubject", to: "batches#addelectivesubject", as: "addelectivesubject"
  post "batches/saveelectivesubject", to: "batches#saveelectivesubject", as: "saveelectivesubject"

  get "batches/createelectivegroup", to: "batches#createelectivegroup", as: "createelectivegroup"
  post "batches/saveelectivegroup", to: "batches#saveelectivegroup", as: "saveelectivegroup"
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
