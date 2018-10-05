class CreateSubjects < ActiveRecord::Migration[5.2]
  def change
    create_table :subjects do |t|
      t.string :bid
      t.string :name
      t.string :abbreviation

      t.timestamps
    end
  end
end
