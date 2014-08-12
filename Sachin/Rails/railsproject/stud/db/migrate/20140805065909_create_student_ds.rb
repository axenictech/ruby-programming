class CreateStudentDs < ActiveRecord::Migration
  def change
    create_table :student_ds do |t|
      t.string :title
      t.text :text

      t.timestamps
    end
  end
end
