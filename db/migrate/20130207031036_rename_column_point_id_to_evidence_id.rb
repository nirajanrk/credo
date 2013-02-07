class RenameColumnPointIdToEvidenceId < ActiveRecord::Migration
   def change
		 rename_column :points, :point_id, :evidence_id
    end 
end
