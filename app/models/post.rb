class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :likes

  def get_users_that_commented
    #if we dont want the email (just the id) we remove the last map
    self.comments.map { |c| c.user_id}.map{|u| User.find(u).email}
  end

end
