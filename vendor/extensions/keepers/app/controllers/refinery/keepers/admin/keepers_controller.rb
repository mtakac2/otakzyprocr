module Refinery
  module Keepers
    module Admin
      class KeepersController < ::Refinery::AdminController

        crudify :'refinery/keepers/keeper',
                :title_attribute => 'firstname', :xhr_paging => true

        def new
          @keeper = Keeper.new
          @politician = Refinery::Politicians::Politician.new
          @subject = params[:subject]
          @elections = Refinery::Elections::Election.all
        end

        def create
          @keeper = Keeper.new(params[:keeper])                              

          if @keeper.save            

            if (params.include? :politician)
              create_politician
              subject_id = @politician.id
            end

            if (params.include? :party)
              create_party
              subject_id = @party.id
            end
            
            @election_subject_election = ElectionSubjectElection.new(params[:election_subject_election])
            @election_subject_election.subject_id = subject_id
            @election_subject_election.save

            redirect_to  refinery.keepers_admin_keepers_path, :notice => "'#{@keeper.email}' was successfully added."
          else
            render 'new'
          end          
        end

        private

          def create_politician
            @politician = Refinery::Politicians::Politician.new(params[:politician])
            @politician.keeper_id = @keeper.id
            @politician.save                           
          end

          def create_party
            @party = Refinery::Parties::Party.new(params[:party])
            @party.keeper_id = @keeper.id
            @party.save                            
          end
      end      
    end
  end
end