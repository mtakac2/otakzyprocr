class AddPropertiesToSubjects < ActiveRecord::Migration
  def change
    add_column :subjects, :properties, :hstore
  end
end
