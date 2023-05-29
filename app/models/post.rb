class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  after_save :increment_post

  def increment_post
    author.increment!(:posts_counter)
  end

  def decrement_post
    author.decrement!(:posts_counter)
  end
end
