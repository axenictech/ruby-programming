class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :firstname
      t.string :lastname
      t.integer :age
      t.text :address
      t.text :email
      t.integer :phoneNo
      t.string :nationality
      t.string :country

      t.timestamps
    end
  end
end
