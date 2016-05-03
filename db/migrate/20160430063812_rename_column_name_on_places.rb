class RenameColumnNameOnPlaces < ActiveRecord::Migration
  def change
    rename_column :places , :lattitude , :latitude
  end
end
