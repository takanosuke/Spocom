class AddColumnToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :subscription_expiration, :datetime
    add_column :users, :team_id, :integer
    add_column :users, :position, :string
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :kana_first_name, :string
    add_column :users, :kana_last_name, :string
    add_column :users, :display_name, :string
    remove_column :users, :name
  end
end
