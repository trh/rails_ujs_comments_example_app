class Post < ActiveRecord::Base
  max_paginates_per 10
  has_many :comments

  def previous
    Post.where("created_at < ?", self.created_at).first
  end
  def next
    Post.where("created_at > ?", self.created_at).first
  end
end
