class CreatePupilSubjects < ActiveRecord::Migration[5.0]
  def change
    create_table :pupil_subjects do |t|
      t.integer :pupil_id
      t.integer :subject_id

      t.timestamps
    end

    add_index :pupil_subjects, [:pupil_id, :subject_id]
  end
end
