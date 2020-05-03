class CommentSerializer < ActiveModel::Serializer
  attributes :id, :content, :post_id, :user_id, :created_at
end
