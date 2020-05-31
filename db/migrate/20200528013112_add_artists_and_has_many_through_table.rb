class AddArtistsAndHasManyThroughTable < ActiveRecord::Migration[5.2]
  def change
    create_table :album_artists do |t|
      t.belongs_to :artist, index: true
      t.belongs_to :album, index: true
      t.timestamps
    end
  end
end
