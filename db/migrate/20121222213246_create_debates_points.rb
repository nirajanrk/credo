class CreateDebatesPoints < ActiveRecord::Migration
  def up
    create_table :debates_points do |t|
      t.integer :debate_id
      t.integer :point_id
    end
  end

  def down
    drop_table :debates_points
  end
end
