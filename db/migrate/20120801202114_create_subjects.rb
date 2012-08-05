class CreateSubjects < ActiveRecord::Migration
  def up
    create_table :subjects do |t|
      t.integer :keeper_id, :null => false
      t.string :subtype, :null => false

      t.timestamps
    end

    add_index :subjects, :keeper_id
  end

  def down
    drop_table :subjects
  end
end