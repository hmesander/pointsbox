class AddKeepToPoints < ActiveRecord::Migration[5.1]
  def change
    add_column :points, :keep, :integer, default: 0
  end
end
