class ApplicationMailer < ActionMailer::Base
  rescue_from(Exception) do |exception|
    ExceptionMailer.inform_exception(exception).deliver_now
  end
end
