class AnimeProducer < ApplicationRecord
  belongs_to :anime
  belongs_to :producer

  has_many :animes
  has_many :genres
end
