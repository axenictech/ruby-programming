class CreateBatches < ActiveRecord::Migration
  def change
    create_table :batches do |t|
      t.string :batchname
      t.integer :batchyear
      t.timestamps
    end
  end
end
