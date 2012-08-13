module Refinery
  module Elections
    module Admin
      class ElectionsController < ::Refinery::AdminController

        crudify :'refinery/elections/election',
          :title_attribute => 'election_type', :xhr_paging => true

        def new
          @election = Election.new
          @election_types = ElectionType.all          
        end

        def create
          @election = Election.new(params[:election])                              

          if @election.save            
            redirect_to  refinery.elections_admin_elections_path, :notice => "'#{@election.election_type.name} #{@election.held}' was successfully added."
          else
            render 'new'
          end          
        end        
      end
    end
  end
end
