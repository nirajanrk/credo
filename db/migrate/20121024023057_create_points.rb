class CreatePoints < ActiveRecord::Migration
  def change
    create_table :points do |t|
      t.text :[point
      t.timestamp] :createdate

      t.timestamps
    end
  end
end
