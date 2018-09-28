class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.text :name
      t.integer :user_id
      t.timestamps
    end
  end
end