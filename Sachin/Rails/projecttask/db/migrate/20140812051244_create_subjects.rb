class CreateSubjects < ActiveRecord::Migration
  def change
    create_table :subjects do |t|
      t.references :Student, index: true
      t.references :Document, index: true

      t.timestamps
    end
  end
end
