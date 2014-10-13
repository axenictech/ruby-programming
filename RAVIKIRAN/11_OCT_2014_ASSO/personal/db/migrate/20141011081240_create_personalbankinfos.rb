class CreatePersonalbankinfos < ActiveRecord::Migration
  def change
    create_table :personalbankinfos do |t|
      t.string :bank_name
      t.integer :acc_no
      t.float :salary
      t.references :personalinfo, index: true

      t.timestamps
    end
  end
end
