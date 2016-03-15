class Category < ActiveRecord::Base
  has_many :places
  mount_uploader :picture , ImageUploader
end
