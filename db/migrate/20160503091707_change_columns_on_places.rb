class ChangeColumnsOnPlaces < ActiveRecord::Migration
  def change
    change_column :places, :latitude , :double
    change_column :places, :longitude , :double
  end
end
