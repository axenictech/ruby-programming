class CreateDetails < ActiveRecord::Migration
  def change
    create_table :details do |t|
      t.string :firstname
      t.string :lastname
      t.integer :age
      t.text :address
      t.text :email
      t.string :phoneNo
      t.string :nationality
      t.string :country

      t.timestamps
    end
  end
end
