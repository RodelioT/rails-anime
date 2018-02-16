json.extract! anime, :id, :mal_id, :name, :episode_count, :rating, :image_url, :created_at, :updated_at
json.url anime_url(anime, format: :json)
