class AddnameToStudent < ActiveRecord::Migration
  def change
  	add_column :student,:sname,:string
  end
end
