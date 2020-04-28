class PostSerializer < ActiveModel::Serializer
  attributes :id, :content, :likes_number, :created_at, :user
  
  def user
    {user_id: self.object.user.id, 
     email: self.object.user.email}
  end 
  
  def likes_number
    self.object.likes.count
  end
end