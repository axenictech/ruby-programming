class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :task1
      t.references :product, index: true

      t.timestamps
    end
  end
end
