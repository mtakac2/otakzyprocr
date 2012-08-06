Refinery::Core::Engine.routes.append do

  # Frontend routes
  namespace :questions do
    resources :questions, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :questions, :path => '' do
    namespace :admin, :path => 'refinery' do
      resources :questions, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
