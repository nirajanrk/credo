class RenameDebatePointsToPoints < ActiveRecord::Migration
    def change
        rename_table :debates_points, :points
    end 
end
