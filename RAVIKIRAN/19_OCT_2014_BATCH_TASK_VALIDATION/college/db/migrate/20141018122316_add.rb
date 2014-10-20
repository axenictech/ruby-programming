class Add < ActiveRecord::Migration
  def change
  	add_column :electives,:batch_id,:integer
  	add_index :electives,:batch_id
  end
end
