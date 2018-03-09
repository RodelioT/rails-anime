class Anime < ApplicationRecord
  validates :mal_id, :name, presence: true
  validates :mal_id, uniqueness: true

  has_many :anime_genres
  has_many :genres, through: :anime_genres

  has_many :anime_producers
  has_many :producers, through: :anime_producers
end
