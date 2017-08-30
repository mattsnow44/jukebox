class CreateAlbums < ActiveRecord::Migration[5.1]
  def change
    create_table :albums do |t|
      t.string :title
      t.string :artist
      t.integer :year
      t.string :genre

      t.timestamps
    end
  end
end
