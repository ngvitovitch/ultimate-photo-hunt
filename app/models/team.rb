class Team
  include MongoMapper::Document

  key :name,  String
  one :game_state
  many :players
end

class GameState
  include MongoMapper::EmbeddedDocument

  key :game_id, BSON::ObjectId
end