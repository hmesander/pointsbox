class RemoveStatusFromRewards < ActiveRecord::Migration[5.1]
  def change
    remove_column :rewards, :status, :integer
  end
end
