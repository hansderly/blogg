require 'rails_helper'

class PostTest < ActiveSupport::TestCase
  describe Post, type: :model do
    author = User.new(name: 'user1')

    let(:author_two) { User.create(name: 'user2', posts_counter: 0) }
    let(:post) do
      Post.create(author: author_two, title: 'title', text: 'text', likes_counter: 0, comments_counter: 0)
    end

    describe 'Title' do
      it 'fail if e,pty' do
        post = Post.new(title: nil, comments_counter: 1, likes_counter: 1, author:)
        expect(post).to_not be_valid
      end

      it 'succes if not empty' do
        post = Post.new(title: 'test', comments_counter: 1, likes_counter: 1, author:)
        expect(post).to be_valid
      end

      it 'cant be greater than number of letter' do
        post = Post.new(title: 'a' * 251, comments_counter: 1, likes_counter: 1, author:)
        expect(post).to_not be_valid
      end
    end


    it 'last_five_comments should return five comments' do
      6.times { Comment.create(text: 'c1', post:, author: author_two) }
      expect(post.last_five_comments.length).to equal(5)
    end
  end
end
