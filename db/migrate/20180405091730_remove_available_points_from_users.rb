class RemoveAvailablePointsFromUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :available_points, :integer
    remove_column :users, :redeemed_points, :integer
  end
end
