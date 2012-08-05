# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "Citizens" do
    describe "Admin" do
      describe "citizens" do
        login_refinery_user

        describe "citizens list" do
          before(:each) do
            FactoryGirl.create(:citizen, :firstname => "UniqueTitleOne")
            FactoryGirl.create(:citizen, :firstname => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.citizens_admin_citizens_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before(:each) do
            visit refinery.citizens_admin_citizens_path

            click_link "Add New Citizen"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Firstname", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::Citizens::Citizen.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("Firstname can't be blank")
              Refinery::Citizens::Citizen.count.should == 0
            end
          end

          context "duplicate" do
            before(:each) { FactoryGirl.create(:citizen, :firstname => "UniqueTitle") }

            it "should fail" do
              visit refinery.citizens_admin_citizens_path

              click_link "Add New Citizen"

              fill_in "Firstname", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::Citizens::Citizen.count.should == 1
            end
          end

        end

        describe "edit" do
          before(:each) { FactoryGirl.create(:citizen, :firstname => "A firstname") }

          it "should succeed" do
            visit refinery.citizens_admin_citizens_path

            within ".actions" do
              click_link "Edit this citizen"
            end

            fill_in "Firstname", :with => "A different firstname"
            click_button "Save"

            page.should have_content("'A different firstname' was successfully updated.")
            page.should have_no_content("A firstname")
          end
        end

        describe "destroy" do
          before(:each) { FactoryGirl.create(:citizen, :firstname => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.citizens_admin_citizens_path

            click_link "Remove this citizen forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::Citizens::Citizen.count.should == 0
          end
        end

      end
    end
  end
end
