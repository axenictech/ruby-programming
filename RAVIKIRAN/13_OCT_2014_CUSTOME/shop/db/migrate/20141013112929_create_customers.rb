class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :c_name
      t.text :address
      t.string :mobile

      t.timestamps
    end
  end
end
