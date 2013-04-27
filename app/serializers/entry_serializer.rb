class EntrySerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :reflection, :occurred_at, :image_latitude, :image_longitude, :created_at, :image_url

  def image_url
    object.image?? object.image.url(:original) : nil
  end
end
