class CreatePartiesParties < ActiveRecord::Migration

  def up
    create_table :refinery_parties, :inherits => :subject do |t|
      t.string :name, :null => false
      t.text :parliament_leaders
      t.text :senate_candidates
      t.text :county_leaders
      t.integer :position

      t.timestamps
    end

    add_index :refinery_parties, :name, :unique => true

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-parties"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/parties/parties"})
    end

    drop_table :refinery_parties

  end

end
