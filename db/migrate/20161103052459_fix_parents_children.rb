class FixParentsChildren < ActiveRecord::Migration[5.0]
  def change
    rename_column :parents_children, :parent_id, :parents_id
  end
end
