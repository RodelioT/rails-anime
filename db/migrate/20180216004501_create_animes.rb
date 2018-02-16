class CreateAnimes < ActiveRecord::Migration[5.1]
  def change
    create_table :animes do |t|
      t.integer :mal_id
      t.string :name
      t.integer :episode_count
      t.decimal :rating
      t.string :image_url

      t.timestamps
    end
  end
end
