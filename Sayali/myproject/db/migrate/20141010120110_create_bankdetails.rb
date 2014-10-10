class CreateBankdetails < ActiveRecord::Migration
  def change
    create_table :bankdetails do |t|
      t.string :bankName
      t.string :accountNo
      t.float :salary
      t.references :people, index: true

      t.timestamps
    end
  end
end
