class Category < ActiveRecord::Base
  has_many :places
  mount_uploader :photo , ImageUploader
end
