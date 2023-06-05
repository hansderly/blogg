require 'rails_helper'

class UserTest < ActiveSupport::TestCase
  describe User, type: :model do
    it 'should have a name' do
      user = User.new(name: nil)
      expect(user).to_not be_valid
    end

    it 'shoulb be a number' do
      user = User.new(posts_counter: -1)
      expect(user).to_not be_valid
    end
  end
end
