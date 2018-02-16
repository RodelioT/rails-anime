# Start with an empty database before adding stuff
Anime.delete_all

csv_filename = Rails.root + 'db/anime_database_sample.csv'
# xml_file = Nokogiri::XML(Rails.root + 'db/season_data/2017_fall.xml')

options = { key_mapping: { anime_id: :mal_id, episodes: :episode_count,
                           genre: nil, type: nil, members: nil } }

animes = SmarterCSV.process(csv_filename, options)

animes[0..99].each do |a|
  anime = Anime.create(a)
end

