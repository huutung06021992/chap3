class ApplicationMailer < ActionMailer::Base

  default from: Settings.email_def
  layout "mailer"
end
