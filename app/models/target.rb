class Target
  include MongoMapper::Document

  key :name,  String
  key :description, String
  key :hint,  String
  key :image_url, String
  key :lat, Float
  key :lon, Float

  validates :name, :description, :image_url, presence: true
end