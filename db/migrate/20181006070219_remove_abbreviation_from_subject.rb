class RemoveAbbreviationFromSubject < ActiveRecord::Migration[5.2]
  def change
    remove_column :subjects, :abbreviation, :string
  end
end
