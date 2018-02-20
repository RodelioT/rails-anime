# Start with an empty database before adding stuff
AnimeGenre.delete_all
Anime.delete_all
Genre.delete_all

csv_filename = Rails.root + 'db/anime_database_sample.csv'
xml_file = Nokogiri::XML(File.read(Rails.root + 'db/season_data/2016_summer.xml'))

options = { key_mapping: { anime_id: :mal_id, episodes: :episode_count,
                           type: nil, members: nil } }
animes = SmarterCSV.process(csv_filename, options)

animes[0..255].each do |anime_item|
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

puts 'finish'


# Creates a hash of hashes with the format: "32574" => {:producers=>"TOHO animation, Bones",
#                                                       :image_url=>"https://myanimelist.cdn-dena.com/images/anime/10/79209.jpg"}
season_data_hash = {}

array = xml_file.css('season anime')
array[0..2].each do |anime|
  producers_node = anime.css('producers').text
  image_node = anime.css('image').text
  id_node = anime.css('id').text

  season_data_hash[id_node] = { producers: producers_node, image_url: image_node }
end

puts season_data_hash