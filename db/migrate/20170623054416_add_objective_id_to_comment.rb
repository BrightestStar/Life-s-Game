class AddObjectiveIdToComment < ActiveRecord::Migration[5.1]
  def change
    add_column :comments, :objective_id, :integer
  end
end
