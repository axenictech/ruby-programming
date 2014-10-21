class CreateBatches < ActiveRecord::Migration
  def change
    create_table :batches do |t|
      t.string :b_name
      t.integer :year

      t.timestamps
    end
  end
end
