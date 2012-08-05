# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "Keepers" do
    describe "Admin" do
      describe "keepers" do
        login_refinery_user

        describe "keepers list" do
          before(:each) do
            FactoryGirl.create(:keeper, :firstname => "UniqueTitleOne")
            FactoryGirl.create(:keeper, :firstname => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.keepers_admin_keepers_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before(:each) do
            visit refinery.keepers_admin_keepers_path

            click_link "Add New Keeper"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Firstname", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::Keepers::Keeper.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("Firstname can't be blank")
              Refinery::Keepers::Keeper.count.should == 0
            end
          end

          context "duplicate" do
            before(:each) { FactoryGirl.create(:keeper, :firstname => "UniqueTitle") }

            it "should fail" do
              visit refinery.keepers_admin_keepers_path

              click_link "Add New Keeper"

              fill_in "Firstname", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::Keepers::Keeper.count.should == 1
            end
          end

        end

        describe "edit" do
          before(:each) { FactoryGirl.create(:keeper, :firstname => "A firstname") }

          it "should succeed" do
            visit refinery.keepers_admin_keepers_path

            within ".actions" do
              click_link "Edit this keeper"
            end

            fill_in "Firstname", :with => "A different firstname"
            click_button "Save"

            page.should have_content("'A different firstname' was successfully updated.")
            page.should have_no_content("A firstname")
          end
        end

        describe "destroy" do
          before(:each) { FactoryGirl.create(:keeper, :firstname => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.keepers_admin_keepers_path

            click_link "Remove this keeper forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::Keepers::Keeper.count.should == 0
          end
        end

      end
    end
  end
end
