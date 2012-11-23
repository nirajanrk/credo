class AddUnderscoresToColumnNames < ActiveRecord::Migration
  def change
    rename_column :authors, :firstname, :first_name
    rename_column :authors, :middlename, :middle_name
    rename_column :authors, :lastname, :last_name
  end
end
