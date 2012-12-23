class CreateTablePointsSources < ActiveRecord::Migration
  def up
    create_table :points_sources do |t|
      t.integer :point_id
      t.integer :source_id
    end
  end

  def down
    drop_table :points_sources
  end
end
