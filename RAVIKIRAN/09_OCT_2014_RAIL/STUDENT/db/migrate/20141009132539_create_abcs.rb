class CreateAbcs < ActiveRecord::Migration
  def change
    create_table :abcs do |t|
      t.string :s_name
      t.integer :s_age

      t.timestamps
    end
  end
end
