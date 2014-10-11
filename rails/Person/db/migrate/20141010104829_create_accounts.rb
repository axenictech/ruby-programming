class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
    	t.string :bankname
    	t.decimal :accountno
    	t.string :accounttype
    	t.references :disk, index: true
    	t.timestamps
    end
  end
end
