class Api::BaseController < ApplicationController

  include Pundit
  
  before_action :debug_log_headers
  before_action :authenticate_user!
  rescue_from ActiveRecord::RecordNotFound, with: :not_found
  rescue_from ActiveRecord::RecordInvalid, with: :record_invalid

  def debug_log_headers
    logger.debug "request.headers['Authorization']:#{request.headers['Authorization']}"
  end

  def not_found
    render json: {
      'errors': [
        {
          'status': '404',
          'title': 'Not Found'
        }
      ]
    }, status: 404
  end

  def record_invalid(message)
    render json: {
      'errors': [
        {
          'status': '400',
          'title': message
        }
      ]
    }, status: 400
  end

end
