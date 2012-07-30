class CreatePoliticiansPoliticians < ActiveRecord::Migration

  def up
    create_table :refinery_politicians, :inherits => :subject do |t|
      t.string :firstname
      t.string :lastname
      t.text :notes
      t.integer :position

      t.timestamps
    end

    add_index :refinery_politicians, [:firstname, :lastname], :unique => true

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-politicians"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/politicians/politicians"})
    end

    drop_table :refinery_politicians

  end

end