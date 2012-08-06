# This migration comes from refinery_questions (originally 1)
class CreateQuestionsQuestions < ActiveRecord::Migration

  def up
    create_table :refinery_questions do |t|
      t.string :title, :null => false
      t.text :content, :null => false
      t.integer :election_id
      t.integer :subject_id
      t.integer :position

      t.timestamps
    end

    add_index :refinery_questions, :title, :unique => true

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-questions"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/questions/questions"})
    end

    drop_table :refinery_questions

  end

end