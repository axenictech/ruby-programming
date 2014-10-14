class CreateSubjects < ActiveRecord::Migration
  def change
    create_table :subjects do |t|
      t.belongs_to :batch
      t.belongs_to :electivgroup
      t.string :subjectname
      t.string :subjectcode
      t.references :batch, index: true
      t.references :electivgroup, index: true
      t.timestamps
    end
  end
end
