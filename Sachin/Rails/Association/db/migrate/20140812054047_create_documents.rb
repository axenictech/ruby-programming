class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.string :docname

      t.timestamps
    end
  end
end
