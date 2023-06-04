require 'rails_helper'

class PostTest < ActiveSupport::TestCase
  describe Post, type: :model do
    author = User.new(name: 'user1')

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
  end
end
