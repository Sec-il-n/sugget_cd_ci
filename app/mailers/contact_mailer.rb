class ContactMailer < ApplicationMailer
  def contact_mail(contact)
    @contact = contact
    mail to: "kannrisya@co.jp",
    subject: t('.contact mail')
  end
end
