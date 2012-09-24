module Refinery
  module Parties
    module Admin
      class PartiesController < ::Refinery::AdminController

        crudify :'refinery/parties/party',
                :title_attribute => 'name', :xhr_paging => true

        def new
          @party = Party.new
          @keepers = Refinery::Keepers::Keeper.order('email ASC')
          @elections = Refinery::Elections::Election.order('held DESC')
        end

        def create
          @party = Party.new(params[:party])
          @election_subject_election = ElectionSubjectElection.new(params[:election_subject_election])          

          if @party.save
            @election_subject_election.subject_id = @party.id
            @election_subject_election.save
            redirect_to refinery.parties_admin_parties_path
          else
            render 'new'
          end
        end
      end
    end
  end
end
