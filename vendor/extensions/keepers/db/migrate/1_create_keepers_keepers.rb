class CreateKeepersKeepers < ActiveRecord::Migration

  def up
    create_table :refinery_keepers do |t|
      t.string :firstname, :null => false
      t.string :lastname, :null => false
      t.string :email, :null => false
      t.string :password_digest, :null => false
      t.string :street
      t.integer :street_number
      t.string :postal_code
      t.string :city
      t.string :phone
      t.integer :position

      t.timestamps
    end

    add_index :refinery_keepers, :email, :unique => true

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-keepers"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/keepers/keepers"})
    end

    drop_table :refinery_keepers

  end

end
