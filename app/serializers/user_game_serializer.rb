class UserGameSerializer < ActiveModel::Serializer
  attributes :user_id, :score, :game_id, :date, :id
  belongs_to :user
  class UserSerializer < ActiveModel::Serializer
    attributes :username, :id
  end
end
