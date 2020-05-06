class PostSerializer < ActiveModel::Serializer
  attributes :id, :content, :likes_number, :created_at, :comments_on_post, :user
  
  def user
    {user_id: self.object.user.id, 
     email: self.object.user.email,
    img_url: self.object.user.img_url}
  end 
  
  def likes_number
    self.object.likes.count
  end

  # def comments_on_post
  #   self.object.comments.order("created_at DESC")
  # end
  def comments_on_post
    customized_comments = []
    self.object.comments.order("created_at DESC").each do |comment|
      custom_comment = comment.attributes
      custom_comment[:user] = comment.user.slice(:email, :img_url)
      customized_comments.push(custom_comment)
    end
    # self.object.comments.order("created_at DESC")
    return customized_comments
  end

end