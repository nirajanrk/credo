class ChangePointsPointToText < ActiveRecord::Migration
  def up
    rename_column :points, :point, :title
  end

  def down
    rename_column :points, :title, :point
  end
end
