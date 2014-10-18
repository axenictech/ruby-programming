class CreateMarks < ActiveRecord::Migration
  def change
    create_table :marks do |t|
      t.string :s_name
      t.integer :marks

      t.timestamps
    end
  end
end
