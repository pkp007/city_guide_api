class RenameColumnNameOnCategories < ActiveRecord::Migration
  def change
    rename_column :categories , :picture , :photo
  end
end
