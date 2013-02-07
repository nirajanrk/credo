class RenamePointIdColumnOnEvidencesSources < ActiveRecord::Migration
   def change
		 rename_column :evidences_sources, :point_id, :evidence_id
    end 
end
