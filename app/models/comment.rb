class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post
  after_save :increment_comment
  after_destroy :decrement_comment

  def increment_comment
    post.increment!(:comments_counter)
  end

  def decrement_comment
    post.decrement!(:comments_counter)
  end
end
