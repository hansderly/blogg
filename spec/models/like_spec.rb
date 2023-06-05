require 'rails_helper'

class LikeTest < ActiveSupport::TestCase
  describe Like, type: :model do
    it 'counter like increase' do
      author = User.create!(name: 'user1', posts_counter: 0)
      post = Post.create!(title: 'example', comments_counter: 1, likes_counter: 1, author:)
      Like.create!(post:, author:)
      expect(post.likes_counter).to eq(2)
    end
  end
end
