class RemoveCreateDateFromPoints < ActiveRecord::Migration
  def up
    remove_column :points, :createdate
  end

  def down
    add_column :points, :createdate, :datetime
  end
end
