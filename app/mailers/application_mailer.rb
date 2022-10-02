class ApplicationMailer < ActionMailer::Base
  default from: ENV['SMTP_EMAIL']
  layout "mailer"
end
