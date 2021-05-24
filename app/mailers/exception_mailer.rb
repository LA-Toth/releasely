class ExceptionMailer < ApplicationBaseMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.exception_mailer.inform_exception.subject
  #
  def inform_exception(exc)
    @exception = exc

    mail subject: 'Exception occurred in Releasely'
  end
end
