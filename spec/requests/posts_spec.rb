require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  let!(:user) { User.create(name: 'Hans', posts_counter: 0) }

  describe 'When do to the index of posts' do
    it 'show be successful' do
      get user_posts_path(user)

      expect(response).to have_http_status(200)
    end

    it 'have a page of index' do
      get user_posts_path(user)

      expect(response).to render_template(:index)
    end
  end

  describe 'goto index' do
    let!(:post) { Post.create(author: user, title: 'Long leave Javascript', comments_counter: 0, likes_counter: 0) }

    it 'shoud be successful' do
      get user_post_path(user, post)

      expect(response.status).to eq(200)
    end

    it 'have a page of show' do
      get user_post_path(user, post)

      expect(response).to render_template(:show)
    end
  end
end
