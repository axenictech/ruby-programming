class CreateEmpinfos < ActiveRecord::Migration
  def change
    create_table :empinfos do |t|
      t.integer :emp_id
      t.string :name
      t.string :address
      t.text :blood_group

      t.timestamps
    end
  end
end
