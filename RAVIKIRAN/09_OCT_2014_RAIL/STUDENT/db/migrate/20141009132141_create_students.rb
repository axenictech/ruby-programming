class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :s_name
      t.integer :s_age

      t.timestamps
    end
  end
end
