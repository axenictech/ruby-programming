class CreateBanks < ActiveRecord::Migration
  def change
    create_table :banks do |t|
      t.string :bankName
      t.string :accountNo
      t.float :salary
      t.references :detail, index: true

      t.timestamps
    end
  end
end
