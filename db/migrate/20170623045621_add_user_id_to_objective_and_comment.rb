class AddUserIdToObjectiveAndComment < ActiveRecord::Migration[5.1]
  def change
    add_column :objectives, :user_id, :integer
    add_column :comments, :user_id, :integer
  end
end
