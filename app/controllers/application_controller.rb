class ApplicationController < ActionController::Base
  if Rails.env.production? || true
    rescue_from(Exception) do |exception|
      ExceptionMailer.inform_exception(exception).deliver_now
    end
  end
end
