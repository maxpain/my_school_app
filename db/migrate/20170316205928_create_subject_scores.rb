class CreateSubjectScores < ActiveRecord::Migration[5.0]
  def change
    create_table :subject_scores do |t|
      t.integer :pupil_id
      t.integer :subject_id
      t.integer :teacher_id
      t.integer :value
      t.string :comment

      t.timestamps
    end
  end
end
