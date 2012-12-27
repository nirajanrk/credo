class AddSummaryToDebates < ActiveRecord::Migration
  def change
    add_column :debates, :summary, :text
  end
end
