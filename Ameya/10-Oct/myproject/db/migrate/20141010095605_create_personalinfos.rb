class CreatePersonalinfos < ActiveRecord::Migration
  def change
    create_table :personalinfos do |t|
      t.string :first_name
      t.string :last_name
      t.string :address
      t.integer :age
      t.integer :ph_no
      t.string :email
      t.string :blood_group
      t.string :country

      t.timestamps
    end
  end
end
