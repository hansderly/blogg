require 'rails_helper'

class UserTest < ActiveSupport::TestCase
  describe User, type: :model do
    let(:user) { User.new(name: 'user1', posts_counter: 0) }

    it 'should have a name' do
      user = User.new(name: nil)

      expect(user).to_not be_valid
    end

    it 'shoulb be a number' do
      user = User.new(posts_counter: -1)

      expect(user).to_not be_valid
    end

    it 'last_three_post methods should return the last 3 posts related to the user' do
      5.times { Post.create(author: user, title: 'title', text: 'text', likes_counter: 0, comments_counter: 0) }

      expect(user.last_three_posts.length).to equal(3)
    end
  end
end
