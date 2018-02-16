class Anime < ApplicationRecord
  validates :mal_id, :name, presence: true
end
