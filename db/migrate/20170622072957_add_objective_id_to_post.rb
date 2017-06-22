class AddObjectiveIdToPost < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :objective_id, :integer
  end
end
