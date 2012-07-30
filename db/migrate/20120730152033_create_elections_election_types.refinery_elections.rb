# This migration comes from refinery_elections (originally 2)
class CreateElectionsElectionTypes < ActiveRecord::Migration

  def up
    create_table :refinery_election_types do |t|            
      t.string :name, :null => false

      t.timestamps
    end

    add_index :refinery_election_types, :name, :unique => true

    # Create foreign key elections_election_types on elections.election_type_id
    execute <<-SQL      
      ALTER TABLE refinery_elections
      ADD CONSTRAINT fk_elections_election_types
      FOREIGN KEY (election_type_id) REFERENCES refinery_election_types;
    SQL

  end

  def down
    execute <<-SQL      
      ALTER TABLE refinery_elections
      DROP CONSTRAINT fk_elections_election_types;      
    SQL
  
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-elections"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/elections/elections"})
    end

    drop_table :refinery_election_types

  end

end