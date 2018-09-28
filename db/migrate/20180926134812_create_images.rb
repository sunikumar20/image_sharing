class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.text :tagline
      t.integer :album_id
      t.attachment :pic
      t.timestamps
    end
  end
end