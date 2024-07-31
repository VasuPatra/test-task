class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  private

  def record_not_found
    render json: {
      status: 'ERROR',
      message: 'Record not found',
      data: []
    }, status: :not_found
  end
end
