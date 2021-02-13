class ContactMailer < ApplicationMailer
  def contact_mail(contact)
    @contact = contact
    mail to: Rails.application.credentials.dig(:gmail, :user_name),
    from: @contact.user.email,
    subject: t('.contact mail')
  end
  # sesの場合
  # def contact_mail(contact)
  #   @contact = contact
  #   mail to: Rails.application.credentials.dig(:gmail, :user_name),
  #   subject: t('.contact mail')
  # end
end
