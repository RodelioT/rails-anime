class CreateAnimeProducers < ActiveRecord::Migration[5.1]
  def change
    create_table :anime_producers do |t|
      t.references :anime, foreign_key: true
      t.references :producer, foreign_key: true

      t.timestamps
    end
  end
end
