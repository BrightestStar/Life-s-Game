class CreateObjectives < ActiveRecord::Migration[5.1]
  def change
    create_table :objectives do |t|
      t.string :name
      t.text :task
      t.text :second
      t.text :third

      t.timestamps
    end
  end
end
