class User < ApplicationRecord
  has_secure_password
  has_many :posts
  has_many :comments
  has_many :likes

  validates :email, presence: true
  validates :email, uniqueness: true

  def get_users_likes
    #if we dont want the email (just the id) we remove the last map
    self.likes.map { |c| c.post_id}
  end
end
