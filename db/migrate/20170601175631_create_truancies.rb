class CreateTruancies < ActiveRecord::Migration[5.0]
  def change
    create_table :truancies do |t|
      t.boolean :check
      t.text :reason

      t.timestamps
    end
  end
end
