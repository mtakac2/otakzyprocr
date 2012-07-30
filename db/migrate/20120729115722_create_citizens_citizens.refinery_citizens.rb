# This migration comes from refinery_citizens (originally 1)
class CreateCitizensCitizens < ActiveRecord::Migration

  def up
    create_table :refinery_citizens do |t|
      t.string :firstname
      t.string :lastname
      t.string :email, :null => false
      t.string :password_digest, :null => false
      t.integer :age, :null => false
      t.integer :county_id, :null => false
      t.string :sex, :null => false
      t.integer :position

      t.timestamps
    end

    add_index :refinery_citizens, :email, :unique => true
    add_index :refinery_citizens, :password_digest    

    # Create foreign key citizens_countys on citizen.county
    # execute <<-SQL      
    #  ALTER TABLE refinery_citizens
    #  ADD CONSTRAINT fk_citizens_countys
    #  FOREIGN KEY (county_id) REFERENCES countys;
    # SQL

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-citizens"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/citizens/citizens"})
    end

    drop_table :refinery_citizens

  end

end
