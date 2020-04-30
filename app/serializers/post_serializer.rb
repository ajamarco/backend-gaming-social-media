class PostSerializer < ActiveModel::Serializer
  attributes :id, :content, :likes_number, :created_at, :comments_on_post, :user
  
  def user
    {user_id: self.object.user.id, 
     email: self.object.user.email}
  end 
  
  def likes_number
    self.object.likes.count
  end

  def comments_on_post
    self.object.comments
  end

end