class Changedatatype < ActiveRecord::Migration
  def change
   change_column :people,:phoneNo,:string
   end
end
