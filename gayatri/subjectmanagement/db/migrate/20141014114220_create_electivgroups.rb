class CreateElectivgroups < ActiveRecord::Migration
  def change
    create_table :electivgroups do |t|
      t.belongs_to :batch
      t.string :groupname
      t.references :batch, index: true
      t.timestamps
    end
  end
end
