# Start with an empty database before adding stuff
Anime.delete_all

csv_filename = Rails.root + 'db/anime_database_sample.csv'
# xml_file = Nokogiri::XML(Rails.root + 'db/season_data/2017_fall.xml')

options = { key_mapping: { anime_id: :mal_id, episodes: :episode_count,
                           type: nil, members: nil } }

animes = SmarterCSV.process(csv_filename, options)

animes[0..99].each do |anime_item|
  csv_genres = anime_item[:genre].split(',').map(&:strip).compact

  # Since we're no longer 'nilling' the genre column
  anime_item.delete(:genre)

  anime = Anime.create(anime_item)

  csv_genres.each do |genre_name|
    # Creates a Genres row from the genre.name, if it doesn't exist already
    genre = Genre.find_or_create_by(name: genre_name)
    AnimeGenre.create(anime: anime, genre: genre)
  end
end

