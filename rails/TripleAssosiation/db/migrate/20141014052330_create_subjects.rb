class CreateSubjects < ActiveRecord::Migration
  def change
    create_table :subjects do |t|
      t.string :name
      t.string :code 
      t.references :batch, index: true
      t.references :electivegroup, index: true
      t.timestamps
    end
  end
end
