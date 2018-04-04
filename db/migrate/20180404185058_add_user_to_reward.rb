class AddUserToReward < ActiveRecord::Migration[5.1]
  def change
    add_reference :rewards, :user, foreign_key: true
  end
end
