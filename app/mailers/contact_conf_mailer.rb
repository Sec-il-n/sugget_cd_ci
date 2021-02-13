class ContactConfMailer < ApplicationMailer
  # smtp
  def contact_conf(contact)
    @contact = contact
    mail to: @contact.user.email,
    from: Rails.application.credentials.dig(:gmail, :user_name),
    subject: t('.greeting')
  end
end
