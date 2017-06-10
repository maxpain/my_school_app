class AddPupilIdToTruances < ActiveRecord::Migration[5.0]
  def change
    add_column :truancies, :pupil_id, :integer
  end
end
