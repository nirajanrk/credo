class JoinTableForAuthorSource < ActiveRecord::Migration
  def up
	create_table :authors_sources do |t|
		t.column :author_id, :integer, :null => false
		t.column :source_id, :integer, :null => false
	end
  end

	def down
		remove_column :author_id, :source_id
		execute <<-SQL
		SQL
		drop_table :authors_sources
	end
end
