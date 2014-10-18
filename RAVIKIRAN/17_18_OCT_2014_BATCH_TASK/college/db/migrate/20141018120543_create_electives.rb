class CreateElectives < ActiveRecord::Migration
  def change
    create_table :electives do |t|
      t.string :es_group
      t.string :es_subject

      t.timestamps
    end
  end
end
