class CreatePersonalinfos < ActiveRecord::Migration
  def change
    create_table :personalinfos do |t|
      t.string :first_name
      t.string :last_name
      t.integer :age
      t.string :ph_no

      t.timestamps
    end
  end
end
