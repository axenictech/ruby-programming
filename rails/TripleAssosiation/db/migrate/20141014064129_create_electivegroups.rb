class CreateElectivegroups < ActiveRecord::Migration
  def change
    create_table :electivegroups do |t|
      t.string :name
      t.string :code 
      t.references :batch, index: true
      t.timestamps
    end
  end
end
