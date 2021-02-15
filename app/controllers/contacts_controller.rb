class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end
  def create
    @contact = Contact.new(params_contact)

    if @contact && begin @contact.save!
      ContactMailer.contact_mail(@contact).deliver
      ContactConfMailer.contact_conf(@contact).deliver
      redirect_to suggests_path, notice: t('.contact created')
    rescue => e
       puts e.class
    end
    else
      flash.now[:warning] = t('.contact faild')
      render 'new'
    end
  end
  private
  def params_contact
    params.require(:contact).permit(:content).merge(user_id: current_user.id)
  end
end
