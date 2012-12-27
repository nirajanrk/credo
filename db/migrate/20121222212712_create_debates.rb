class CreateDebates < ActiveRecord::Migration
  def change
    create_table :debates do |t|
      t.string :title
	  t.text :summary
      t.timestamps
    end
  end
end
