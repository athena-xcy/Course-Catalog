class CreateCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :courses do |t|
      t.string :name
      t.string :code
      t.float :credits
      t.text :description
      t.boolean :independent_study

      t.timestamps
    end
  end
end
