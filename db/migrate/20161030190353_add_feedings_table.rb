class AddFeedingsTable < ActiveRecord::Migration[5.0]
  def change
    create_table :feedings do |t|
      t.datetime :feeding
      t.integer :child_id
    end
    # change_column :children, :feedings, :string
  end
end
