require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'when go to the index page of users' do
    it 'successfully' do
      get users_path
      expect(response).to have_http_status(200)
    end

    it 'have a page of index' do
      get users_path

      expect(response).to render_template(:index)
    end
  end

  describe 'when go to the show page of users' do
    let!(:user) { User.create(name: 'Hans', posts_counter: 0) }

    it 'successfull' do
      get user_path(user.id)

      expect(response.status).to eq(200)
    end

    it 'have a page of show' do
      get user_path(user.id)

      expect(response).to render_template(:show)
    end
  end
end
