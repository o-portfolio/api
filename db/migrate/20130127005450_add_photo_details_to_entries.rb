class AddPhotoDetailsToEntries < ActiveRecord::Migration
  def change
    add_column :entries, :image_latitude, :decimal, :precision => 15, :scale => 10
    add_column :entries, :image_longitude, :decimal, :precision => 15, :scale => 10
  end
end
