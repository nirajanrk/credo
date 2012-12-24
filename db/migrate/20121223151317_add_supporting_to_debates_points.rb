class AddSupportingToDebatesPoints < ActiveRecord::Migration
  def change
    add_column :debates_points, :supporting, :boolean
  end
end
