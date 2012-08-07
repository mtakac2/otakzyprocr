Refinery::Core::Engine.routes.append do

  # Frontend routes
  namespace :emails do
    resources :emails, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :emails, :path => '' do
    namespace :admin, :path => 'refinery' do
      resources :emails, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
