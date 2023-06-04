require 'rails_helper'

class CommentTest < ActiveSupport::TestCase
  describe Comment, type: :model do
    it 'increase number' do
      author = User.create!(name: 'user1', posts_counter: 0)
      post = Post.create!(title: 'example', comments_counter: 1, likes_counter: 2, author:)
      Comment.create!(post:, author:)
      expect(post.comments_counter).to eq(2)
    end
  end
end
