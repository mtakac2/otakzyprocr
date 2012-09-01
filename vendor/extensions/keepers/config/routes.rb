Refinery::Core::Engine.routes.append do

  # Frontend routes
  namespace :keepers do
    resources :keepers, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :keepers, :path => '' do
    namespace :admin, :path => 'refinery' do
      resources :keepers, :except => :show do       
        collection do
          get  :politician_form
          get  :party_form
          post :update_positions
        end
      end
    end
  end  
end