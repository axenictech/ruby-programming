class CreateStudTables < ActiveRecord::Migration
  def change
    create_table :stud_tables do |t|
      t.string :s_name
      t.integer :s_age

      t.timestamps
    end
  end
end
