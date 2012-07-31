class CreateIndexOnSubjectsProperties < ActiveRecord::Migration
  def up
    execute "CREATE INDEX subjects_properties
      ON subjects
      USING GIN(properties)"
  end

  def down
    execute "DROP INDEX subjects_properties"
  end
end
