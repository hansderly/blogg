class Api::V1::BaseController < ApplicationController
  before_action :authenticate

  def authenticate
    token = request.headers['Authorization']
    @current_user = User.find_by(auth_token: token)

    render json: { error: 'Not Authorized' }, status: 401 unless current_user
  end
end
