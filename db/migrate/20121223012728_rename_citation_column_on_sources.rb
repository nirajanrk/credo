class RenameCitationColumnOnSources < ActiveRecord::Migration
  def up
    rename_column :sources, :citation, :citation_count
  end

  def down
    rename_column :sources, :citation_count, :citation
  end
end
