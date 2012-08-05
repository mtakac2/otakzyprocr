require 'spec_helper'

module Refinery
  module Elections
    describe Election do
      describe "validations" do
        subject do
          FactoryGirl.create(:election)
        end

        it { should be_valid }
        its(:errors) { should be_empty }
      end
    end
  end
end
