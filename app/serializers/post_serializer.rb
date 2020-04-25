class PostSerializer < ActiveModel::Serializer
  attributes :id, :content, :number_of_likes, :user
  
  def user
    {user_id: self.object.user.id, 
     email: self.object.user.email}
  end 
end