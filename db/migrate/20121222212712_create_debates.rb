class CreateDebates < ActiveRecord::Migration
  def change
    create_table :debates do |t|
      t.string :title
      t.timestamps
    end
  end
end
