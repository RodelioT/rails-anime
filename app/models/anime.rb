class Anime < ApplicationRecord
  validates :mal_id, :name, presence: true

  has_many :anime_genres
  has_many :genres, through: :anime_genres
end
