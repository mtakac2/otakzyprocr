class CreateEmailsEmails < ActiveRecord::Migration

  def up
    create_table :refinery_emails do |t|
      t.string :title, :null => false
      t.text :content
      t.string :for
      t.integer :position

      t.timestamps
    end

    add_index :refinery_emails, :title, :unique => true

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-emails"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/emails/emails"})
    end

    drop_table :refinery_emails

  end

end