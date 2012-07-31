Refinery::Core::Engine.routes.append do

  # Frontend routes
  namespace :parties do
    resources :parties, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :parties, :path => '' do
    namespace :admin, :path => 'refinery' do
      resources :parties, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
