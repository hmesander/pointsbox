class AddImageToRewards < ActiveRecord::Migration[5.1]
  def change
    add_column :rewards, :image, :binary
  end
end
