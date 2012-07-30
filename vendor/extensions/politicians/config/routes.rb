Refinery::Core::Engine.routes.append do

  # Frontend routes
  namespace :politicians do
    resources :politicians, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :politicians, :path => '' do
    namespace :admin, :path => 'refinery' do
      resources :politicians, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
