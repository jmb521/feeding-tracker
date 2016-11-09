class ModifyFeedingsTable < ActiveRecord::Migration[5.0]
  def change
    rename_column :feedings, :children_id, :child_id
  end
end
