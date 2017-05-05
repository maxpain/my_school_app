class CreateLineItems < ActiveRecord::Migration[5.0]
  def change
    create_table :line_items do |t|
      t.integer :count
      t.float :total_price

      t.timestamps
    end
  end
end
