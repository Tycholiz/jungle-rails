# B = index
# R = show
# E = update
# A = create
# D = destroy
#
# Ruby has 2 more actions
# new --> a get request that returns a form that can be filled out to execute the create action
# edit --> a get request that returns a form that can be filled out to execute the update action

Rails.application.routes.draw do

  resources :users
  root to: 'products#index'

  #here, the data and the FORM of that data is declared. ex. the data type 'products' is needed in forms of index and show. These are both different representations of the same data table.
  resources :products, only: [:index, :show]
  resources :products, only: [:index, :show] do
    resources :reviews, only: [:create, :destroy]
  end
  resources :categories, only: [:index, :show]

  resource :cart, only: [:show] do
    post   :add_item
    post   :remove_item
  end

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/signup' => 'users#new'
  post '/users' => 'users#create'

  resources :orders, only: [:create, :show]

  namespace :admin do
    root to: 'dashboard#show'  #the page rendered on /admins
    resources :products, :categories, except: [:edit, :update, :show]
  end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
    # get 'products/:id' => 'catalog#view'

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
