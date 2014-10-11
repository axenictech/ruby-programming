class CreateBankinfos < ActiveRecord::Migration
  def change
    create_table :bankinfos do |t|
      t.belongs_to :personalinfo
      t.string :bank_name
      t.string :account_no
      t.float :salary

      # this line adds an integer column called `account_id`
      t.references :personalinfo, index: true

      t.timestamps
    end
  end
end
