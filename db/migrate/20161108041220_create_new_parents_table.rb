class CreateNewParentsTable < ActiveRecord::Migration[5.0]
  def change
    drop_table :parents


    create_table :parents do |t|
      t.string :username
      t.string :name
      t.string :password_digest
      t.string :email

    end
  end
end
