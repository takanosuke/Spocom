class ChangeColumnToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :provider, :string
    add_column :users, :uid, :string
    add_column :users, :subscription_expiration, :datetime
    add_column :users, :team_id, :integer
    add_column :users, :position, :integer #1=player,2=coach,100=admin
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :kana_first_name, :string
    add_column :users, :kana_last_name, :string
  end
end
