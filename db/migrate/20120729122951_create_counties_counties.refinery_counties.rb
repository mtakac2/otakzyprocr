# This migration comes from refinery_counties (originally 1)
class CreateCountiesCounties < ActiveRecord::Migration

  def up
    create_table :refinery_counties do |t|
      t.string :name
      t.integer :position

      t.timestamps
    end

    add_index :refinery_counties, :name, :unique => true

    # Create foreign key citizens_countys on citizens.county_id
    execute <<-SQL      
      ALTER TABLE refinery_citizens
      ADD CONSTRAINT fk_citizens_countys
      FOREIGN KEY (county_id) REFERENCES refinery_counties;
    SQL
  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-counties"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/counties/counties"})
    end

    drop_table :refinery_counties

  end

end
