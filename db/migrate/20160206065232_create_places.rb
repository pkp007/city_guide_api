class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.string :place_name
      t.belongs_to :location , index: true
      t.belongs_to :category , index: true
      t.string :address
      t.string :lattitude
      t.string :longitude
      t.string :short_description
      t.string :photo
      t.string :contact_number
      t.string :contact_person
      t.timestamps null: false
    end
  end
end
