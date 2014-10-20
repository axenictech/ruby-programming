class CreateNormals < ActiveRecord::Migration
  def change
    create_table :normals do |t|
      t.integer :ns_code
      t.string :ns_subject
      t.references :batch, index: true
      t.timestamps
    end
  end
end
