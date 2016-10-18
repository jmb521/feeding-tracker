class ChangeParents < ActiveRecord::Migration[5.0]
  def change
    # drop_table :children

    create_table :children do |t|
      t.string :child_name
      t.datetime :last_feeding
    end
  end
end
