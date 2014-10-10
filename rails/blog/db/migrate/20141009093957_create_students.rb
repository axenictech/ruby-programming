class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
    	t.string  :age
    	t.integer :roll
    	t.integer :marks
    	t.timestamps
    end
  end
end
