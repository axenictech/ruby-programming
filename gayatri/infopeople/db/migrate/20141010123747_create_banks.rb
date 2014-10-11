class CreateBanks < ActiveRecord::Migration
  def change
    create_table :banks do |t|
      t.belongs_to :laptop
      t.string :bname
      t.string :baddress
      t.string :account_no
      t.string :rs
      t.timestamps
      t.references :laptop, index: true
    end

  end
end
