# This migration comes from refinery_elections (originally 2)
class CreateElectionsElectionTypes < ActiveRecord::Migration

  def up
    create_table :refinery_election_types do |t|
      t.string :name      

      t.timestamps
    end

    add_index :refinery_election_types, :name, :unique => true

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-elections"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/elections/elections"})
    end

    execute <<-SQL
      DROP TABLE refinery_election_types CASCADE
    SQL

  end

end