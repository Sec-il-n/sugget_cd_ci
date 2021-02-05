class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end
  def create
    @contact = Contact.new(params_contact)
    if @contact.save
      ContactMailer.contact_mail(@contact).deliver
      redirect_to root_path, notice: t('.contact created')
    else
      render 'new'
    end
  end
  private
  def params_contact
    params.require(:contact).permit(:content).merge(user_id: current_user.id)
  end
end
