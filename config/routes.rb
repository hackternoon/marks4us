J4::Application.routes.draw do

  match 'get_tag_mrks/:tag', :to => 'mrks#get_tag_mrks', :as => :get_tag_mrks, :via => :get
  get 'contact', :to => 'home#contact', :as => :get_contact
  get 'about', :to => 'home#about', :as => :get_about
  get 'users/index', :to => 'users#index', :as => :get_users_index

  match 'users/show/:user_id' => 'users#show', :as => :get_user_show, :via => :get

  resources :mrks

  get 'usrs/get_guest', :to => 'usrs#get_guest', :as => 'get_usr_guest'
  get 'usrs/get_change_password', :to => 'usrs#get_change_password', :as => 'get_usr_change_password'
  put 'usrs/put_change_password', :to => 'usrs#put_change_password', :as => 'put_usr_change_password'
  resources :usrs

  devise_for :users, :skip => [:sessions]
  devise_scope :user do
    get 'users/sign_in', :to => 'usr_sessions#new', :as => 'new_user_session'
    post 'users/sign_in', :to => 'usr_sessions#create', :as => 'user_session'
    get 'users/sign_out', :to => 'usr_sessions#destroy', :as => 'destroy_user_session'
  end

  get 'home/index'
  root :to => 'home#index'

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
