class AddAvailablePointsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :available_points, :integer, default: 0
    add_column :users, :redeemed_points, :integer, default: 0
  end
end
