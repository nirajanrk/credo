class CreateSources < ActiveRecord::Migration
  def change
    create_table :sources do |t|
      t.string :type
      t.text :title
      t.string :year
      t.text :journal
      t.text :description
      t.integer :citation
      t.text :url

      t.timestamps
    end
  end
end
