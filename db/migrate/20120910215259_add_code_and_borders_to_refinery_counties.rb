class AddCodeAndBordersToRefineryCounties < ActiveRecord::Migration
  def change
    add_column :refinery_counties, :code, :string
    add_column :refinery_counties, :borders, :text
  end
end
