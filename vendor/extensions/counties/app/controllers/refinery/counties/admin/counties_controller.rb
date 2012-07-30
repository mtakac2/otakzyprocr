module Refinery
  module Counties
    module Admin
      class CountiesController < ::Refinery::AdminController

        crudify :'refinery/counties/county',
                :title_attribute => 'name', :xhr_paging => true

      end
    end
  end
end
