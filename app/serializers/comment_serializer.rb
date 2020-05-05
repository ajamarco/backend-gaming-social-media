class CommentSerializer < ActiveModel::Serializer
  attributes :id, :content, :post_id, :user_id, :created_at, :user
  
  def user
      custom_obj = {}
      custom_obj[:email] = self.object.user.email
      return custom_obj
  end

end
