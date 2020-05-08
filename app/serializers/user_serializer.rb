class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :created_at, :bio, :location, :website, :img_url, :posts

  def posts
    self.object.posts
  end 
end
