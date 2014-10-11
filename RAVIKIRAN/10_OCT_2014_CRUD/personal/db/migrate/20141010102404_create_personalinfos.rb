class CreatePersonalinfos < ActiveRecord::Migration
  def change
    create_table :personalinfos do |t|
      t.string :first_nanme
      t.string :last_name
      t.text :address
      t.integer :age
      t.string :email
      t.integer :mobile
      t.string :bloodgroup
      t.string :country

      t.timestamps
    end
  end
end
