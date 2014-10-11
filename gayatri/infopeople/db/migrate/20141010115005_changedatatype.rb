class Changedatatype < ActiveRecord::Migration
  def change
  	change_column :laptops,:phone,:string
  	
  end

end
