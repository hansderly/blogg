class User < ApplicationRecord
  has_many :posts, foreign_key: :author_id, dependent: :destroy
  has_many :comments, foreign_key: :author_id, dependent: :destroy
  has_many :likes, foreign_key: :author_id, dependent: :destroy
  before_validation :initial_number, on: :create

  validates :name, presence: true
  validates :posts_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def last_three_posts
    posts.order(created_at: :desc).limit(3)
  end

  def initial_number
    self.posts_counter = 0
  end

  def all_posts
    posts.includes(:comments, comments: :author)
  end
end
