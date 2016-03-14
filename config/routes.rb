  Rails.application.routes.draw do

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  resources :invites
  resources :places
  resources :users do
    resources :groups do
      resources :posts do
        resources :comments
     end
    end
  end

  # You can have the root of your site routed with "root"
  root 'sessions#new'

  get 'login' => 'sessions#new', as: :login
  post 'search' => 'places#index', as: :search
  get 'search' => 'places#index'
  post 'post_login' => 'sessions#create', as: :login_user
  delete 'signout' => 'sessions#destroy', as: :logout_user
  get 'signout' => 'sessions#destroy', as: :get_logout_user 
  post '/newpost' => 'posts#create'
  post '/newcomment' => 'comments#create'
  post '/newgroup' => 'groups#create'
  delete '/leavegroup' => 'groups#leave_group', as: :leave_group

  # email user
  get '/invite/:user_id/group/:id' => 'invites#invite', as: :invite_user
  get '/invite/:id/groups' => 'invites#select_group', as: :invite_user_groups

  # sending token as link to user to add to group
  get '/accept_invite/:invite_token' => 'invites#accept_token', as: :accept_token

  # resources :followers, :only => [:create, :destroy]
  post '/update_follow_status' => 'users#update_follow_status', as: :update_follow_status

  post '/update_group_status/:id' => 'users#update_group_status', as: :update_group_status

# add a place to group
  get '/add_place_group' => 'users#add_place_group', as: :add_place_group

# get to add place to group page
  get '/add_to_group' => 'users#add_to_group', as: :add_to_group

  # get '/user/:id/followers' => 'users#followers', as: 'followers'
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
