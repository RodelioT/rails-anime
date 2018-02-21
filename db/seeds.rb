# Start with an empty database before adding stuff
AnimeGenre.delete_all
Anime.delete_all
Genre.delete_all

# Creates a hash of hashes to store all season data with the format:
# {"mal_id32574" => {:producers=>"TOHO animation, Bones",
#                    :image_url=>"https://myanimelist.cdn-dena.com/images/anime/10/79209.jpg"}, ...}
season_data_hash = {}

# Array of all XML file names within the season_data folder
xml_file_array = Dir.glob(File.join(Rails.root, 'db', 'season_data', '*'))

xml_file_array.each do |xml_file_name|
  xml_file = Nokogiri::XML(File.read(xml_file_name))

  # Array of all 'Anime' Tags within the currently processed file
  array = xml_file.css('season anime')
  array.each do |anime|
    producers_node = anime.css('producers').text
    image_node = anime.css('image').text
    id_node = 'mal_id' + anime.css('id').text

    season_data_hash[id_node] = { producers: producers_node, image_url: image_node }
  end
end

csv_filename = Rails.root + 'db/anime_database_sample.csv'

options = { key_mapping: { anime_id: :mal_id, episodes: :episode_count,
                           type: nil, members: nil } }
animes = SmarterCSV.process(csv_filename, options)

animes[0..63].each do |anime_item|
  anime_item[:genre] = 'unlisted' if anime_item[:genre].nil?

  csv_genres = anime_item[:genre].split(',').map(&:strip).compact

  # Since we're no longer 'nilling' the genre column
  anime_item.delete(:genre)

  # Inserting the image_url if the mal_id exists in the xml files
  mal_id_key = 'mal_id' + anime_item[:mal_id].to_s
  anime_item[:image_url] = season_data_hash.key?(mal_id_key) ? season_data_hash[mal_id_key][:image_url] : 'https://i.imgur.com/NkXDT1E.png'

  anime = Anime.create(anime_item)

  csv_genres.each do |genre_name|
    # Creates a Genres row from the genre.name, if it doesn't exist already
    genre = Genre.find_or_create_by(name: genre_name)
    AnimeGenre.create(anime: anime, genre: genre)
  end
end

puts 'finish'
