class AddCurrenLatitudeAndLongitudeToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :currentlatitude, :float
    add_column :users, :currentlongitude, :float
  end
end
