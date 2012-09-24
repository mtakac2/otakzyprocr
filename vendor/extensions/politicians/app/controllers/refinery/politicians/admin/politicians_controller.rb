module Refinery
  module Politicians
    module Admin
      class PoliticiansController < ::Refinery::AdminController

        crudify :'refinery/politicians/politician',
                :title_attribute => 'firstname', :xhr_paging => true

        def new
          @politician = Politician.new
          @keepers = Refinery::Keepers::Keeper.order('email ASC')
          @elections = Refinery::Elections::Election.order('held DESC')
        end

        def create
          @politician = Politician.new(params[:politician])
          @election_subject_election = ElectionSubjectElection.new(params[:election_subject_election])          

          if @politician.save
            @election_subject_election.subject_id = @politician.id
            @election_subject_election.save
            redirect_to refinery.politicians_admin_politicians_path
          else
            render 'new'
          end
        end

      end
    end
  end
end
