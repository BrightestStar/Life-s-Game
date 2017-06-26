class AddFDateToObjectives < ActiveRecord::Migration[5.1]
  def change
    add_column :objectives, :f_date, :date
  end
end
