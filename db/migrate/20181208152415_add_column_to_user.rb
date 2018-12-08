class AddColumnToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :subscription_expiration, :datetime
  end
end
