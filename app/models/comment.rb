class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post
  after_save :increment_comment

  def increment_comment
    post.increment!(:comments_count)
  end

  def decrement_comment
    post.decrement!(:comments_count)
  end
end
