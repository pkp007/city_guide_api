class ChangeDefaultValueOfLatLngPlaces < ActiveRecord::Migration
  def change
    change_column_null :places,:latitude,false, 0.00
    change_column_null :places,:longitude,false,0.00
  end
end
