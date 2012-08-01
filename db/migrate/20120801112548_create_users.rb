class CreateUsers < ActiveRecord::Migration
  def up
    create_table :users do |t|
      t.string :firstname
      t.string :lastname
      t.string :email, :null => false
      t.string :password_digest, :null => false
      t.string :subtype, :null => false

      t.timestamps
    end

    add_index :users, :email, :unique => true
  end

  def down
    drop_table :users
  end
end