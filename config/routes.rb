Otazkyprocr::Application.routes.draw do  
  
  get "tasks/index"

  get "tasks/new"

  get "tasks/edit"

  get "password_resets/new"
  match 'payments/paypal' => 'payments#paypal'
  match 'map/promised-hours' => 'map#promised_hours'
  match 'map/worked-hours' => 'map#worked_hours'

  namespace :map do
    resources :citizens,       only: [:index, :show]
    resources :promised_hours, only: [:index, :show]
    resources :worked_hours,   only: [:index, :show]
  end

  resources :questions

  resources :citizens do
    resources :questions do
      resources :tasks
    end
  end
  resources :sessions
  resources :citizens_questions
  resources :elections
  resources :password_resets
  resources :parties
  resources :politicians
  resources :keepers do
    resources :politicians do
      resources :questions
    end
    resources :parties do 
      resources :questions
    end
  end

  match 'stats' => 'stats#index'
  match 'solve-question/:question_id' => 'citizens_questions#new'
  match 'keepers/activate/:activation_code' => 'keepers#activate'
  match 'citizens/activate/:activation_code' => 'citizens#activate'
  match 'citizens_questions/:id/move' => 'citizens_questions#move'
  match 'citizens_question/:id/relocate_hours' => 'citizens_questions#relocate_hours', via: :post
  match 'map/' => 'map#index'
  match '/mark-question-as-solved/:question_id' => 'citizens#mark_question_as_solved', via: :post

  # This line mounts Refinery's routes at the root of your application.
  # This means, any requests to the root URL of your application will go to Refinery::PagesController#home.
  # If you would like to change where this extension is mounted, simply change the :at option to something different.
  #
  # We ask that you don't use the :as option here, as Refinery relies on it being the default of "refinery"
  mount Refinery::Core::Engine, :at => '/'
  resources :politicians
  resources :parties

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