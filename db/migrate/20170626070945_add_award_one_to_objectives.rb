class AddAwardOneToObjectives < ActiveRecord::Migration[5.1]
  def change
    add_column :objectives, :award_first, :string
  end
end
