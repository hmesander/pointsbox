class RemoveNumberFromPoints < ActiveRecord::Migration[5.1]
  def change
    remove_column :points, :number, :integer
  end
end
