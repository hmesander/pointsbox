class RemoveImageFromRewards < ActiveRecord::Migration[5.1]
  def change
    remove_column :rewards, :image, :binary
  end
end
