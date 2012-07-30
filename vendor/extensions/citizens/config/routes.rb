Refinery::Core::Engine.routes.append do

  # Frontend routes
  namespace :citizens do
    resources :citizens, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :citizens, :path => '' do
    namespace :admin, :path => 'refinery' do
      resources :citizens, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
