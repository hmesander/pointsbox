class AddValueToRewards < ActiveRecord::Migration[5.1]
  def change
    add_column :rewards, :value, :integer
  end
end
