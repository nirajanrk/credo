class RenamePointsSourcesToEvidencesSources < ActiveRecord::Migration
    def change	
        rename_table :points_sources, :evidences_sources
    end 
end
