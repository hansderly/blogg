class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'

  after_save :increment_post

  def increment_post
    author.increment!(:posts_counter)
  end

  def decrement_post
    author.decrement!(:posts_counter)
  end
end
