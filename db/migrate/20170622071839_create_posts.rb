class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.text :first
      t.text :second
      t.text :third

      t.timestamps
    end
  end
end
