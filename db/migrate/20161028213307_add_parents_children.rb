class AddParentsChildren < ActiveRecord::Migration[5.0]
  def change
    create_table :parents_children do |t|
      t.integer :child_id
      t.integer :parent_id
    end
  end
end
