class UserGameSerializer < ActiveModel::Serializer
  attributes :user_id, :score, :game_id, :date
  belongs_to :user
  class UserSerializer < ActiveModel::Serializer
    attributes :username, :id
  end
end
