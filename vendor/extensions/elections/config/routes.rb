Refinery::Core::Engine.routes.append do

  # Frontend routes
  namespace :elections do
    resources :elections, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :elections, :path => '' do
    namespace :admin, :path => 'refinery' do
      resources :elections, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
