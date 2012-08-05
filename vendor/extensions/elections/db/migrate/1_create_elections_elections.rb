class CreateElectionsElections < ActiveRecord::Migration

  def up
    create_table :refinery_elections do |t|
      t.integer :election_type_id, :null => false
      t.date :held, :null => false
      t.text :description
      t.integer :position

      t.timestamps
    end

    add_index :refinery_elections, :election_type_id
    add_index :refinery_elections, [:election_type_id, :held], :unique => true

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-elections"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/elections/elections"})
    end

    drop_table :refinery_elections

  end

end