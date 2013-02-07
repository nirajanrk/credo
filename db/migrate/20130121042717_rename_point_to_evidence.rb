class RenamePointToEvidence < ActiveRecord::Migration
    def change
        rename_table :points, :evidences
    end 
 end
