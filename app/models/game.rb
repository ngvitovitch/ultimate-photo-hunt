class Game
  include MongoMapper::Document

  key :name, String
  many :target_zones

#  validates :name, presence: true, uniqueness: true
#  validates_associated :target_zones
end

class TargetZone
  include MongoMapper::EmbeddedDocument

  key :name,  String  # a descriptive name
  key :map, Hash  # google map api highlight hash
  many :targets # targets in this zone

#  validates :name, :map, presence: true
#  validates_associated :targets
end
