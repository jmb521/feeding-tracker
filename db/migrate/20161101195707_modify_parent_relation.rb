class ModifyParentRelation < ActiveRecord::Migration[5.0]
  def change
    rename_column :parents, :child_id, :children_id
  end
end
