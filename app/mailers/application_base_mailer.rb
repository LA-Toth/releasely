class ApplicationBaseMailer < ApplicationMailer
  layout 'mailer'
  append_view_path Rails.root.join('app', 'views', 'mailers')
end
