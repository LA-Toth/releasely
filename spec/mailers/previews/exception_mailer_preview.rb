# Preview all emails at http://localhost:3000/rails/mailers/exception_mailer
class ExceptionMailerPreview < ActionMailer::Preview
  # Preview this email at http://localhost:3000/rails/mailers/exception_mailer/inform_exception
  def inform_exception
    raise ActiveRecord::StatementInvalid, 'x'
  rescue Exception => e
    ExceptionMailer.inform_exception(e)
  end
end
