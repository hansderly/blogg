class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts, foreign_key: :author_id, dependent: :destroy
  has_many :comments, foreign_key: :author_id, dependent: :destroy
  has_many :likes, foreign_key: :author_id, dependent: :destroy
  before_validation :initial_number, on: :create
  before_create :set_user_token

  validates :name, presence: true
  validates :posts_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def last_three_posts
    posts.order(created_at: :desc).limit(3)
  end

  def initial_number
    self.posts_counter = 0
  end

  def set_user_token
    self.user_token = SecureRandom.hex(20)
  end

  def all_posts
    posts.includes(:comments, comments: :author)
  end
end
