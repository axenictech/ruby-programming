class CreateDisks < ActiveRecord::Migration
  def change
    create_table :disks do |t|
      t.string :firstName 
      t.string :lastName
      t.string :address
      t.integer :age
      t.string :email
      t.decimal :phone
      t.string :bloodgroup
      t.string :country
      t.string :nationality
      t.timestamps
     end
  end
end
