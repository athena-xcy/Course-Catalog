class AddBidToInstructor < ActiveRecord::Migration[5.2]
  def change
    add_column :instructors, :bid, :string
  end
end
