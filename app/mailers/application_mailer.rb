class ApplicationMailer < ActionMailer::Base
  default from: Rails.application.credentials.dig(:gmail, :usesr_name)
  layout 'mailer'
end
