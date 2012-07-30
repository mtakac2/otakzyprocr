class CreateSubjects < ActiveRecord::Migration
  def up
    create_table :subjects do |t|
      t.string :contact_person, :null => false
      t.string :email, :null => false
      t.string :phone
      t.string :subtype, :null => false

      t.timestamps
    end

    add_index :subjects, :contact_person
    add_index :subjects, :email
  end

  def down
    drop_table :subjects
  end
end
