class Player
  include MongoMapper::Document

  key :name,  String
  belongs_to :team

  validates :name, presence: true, uniqueness: true
end