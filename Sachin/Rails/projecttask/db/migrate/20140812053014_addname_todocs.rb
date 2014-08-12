class AddnameTodocs < ActiveRecord::Migration
  def change
  	add_column :documents,:docname,:string
  end
end
