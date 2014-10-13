class AddcolumnBloodgroup < ActiveRecord::Migration
  def change
  	add_column :details,:bloodGroup,:text
  end
end
