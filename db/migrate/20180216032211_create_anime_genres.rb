class CreateAnimeGenres < ActiveRecord::Migration[5.1]
  def change
    create_table :anime_genres do |t|
      t.references :anime, foreign_key: true
      t.references :genre, foreign_key: true

      t.timestamps
    end
  end
end
