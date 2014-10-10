class Addcolumnbloodgroup < ActiveRecord::Migration
  def change
  	add_column :people,:bloodGroup,:text
  end
end
