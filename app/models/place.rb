class Place < ActiveRecord::Base
  belongs_to :category
  belongs_to :location

  mount_uploader :photo , ImageUploader


  def self.find_by_category(category)
    Place.where(category_id:  category)
  end

  def self.find_by_location(location,category)
    Place.where(location_id: location ,category_id: category)
  end

  def self.find_by_search_text(search_text)
    Place.where("place_name LIKE ?","%#{search_text}%")
  end
end
