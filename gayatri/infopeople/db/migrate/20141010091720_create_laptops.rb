class CreateLaptops < ActiveRecord::Migration
  def change
    create_table :laptops do |t|
      t.string :fname
      t.string :lname
      t.string :address
      t.integer :age
      t.string :email
      t.integer :phone
      t.string :nationality
      t.string :bloodgroup
      t.string :country
      t.timestamps
    end
  end
end
