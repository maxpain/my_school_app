class AddVerificationFields < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :verification_sent_at, :datetime
    add_column :orders, :verificated_at, :datetime
    add_column :orders, :verification_code, :string
  end
end
