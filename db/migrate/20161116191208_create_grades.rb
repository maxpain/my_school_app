class CreateGrades < ActiveRecord::Migration[5.0]
  def change
    create_table :grades do |t|
      t.string :name
      t.integer :teacher_id
      t.string :comment

      t.timestamps
    end
  end
end
