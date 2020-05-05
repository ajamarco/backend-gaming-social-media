class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :created_at, :bio, :location, :website, :posts

  def posts
    self.object.posts
  end 
end
