class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :name
      t.string :address
      t.integer :marks

      t.timestamps
    end
  end
end
