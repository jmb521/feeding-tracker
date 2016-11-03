class ModifyParentsChildrenRelation < ActiveRecord::Migration[5.0]
  def change
    rename_column :parents_children, :child_id, :children_id
  end
end
