class ContactFormsController < ApplicationController

  def create
    @contact = ContactForm.new contact_form_params
    if @contact.deliver
      flash[:success] = "Your message has been sent."
      render 'static/cover'
    else
      flash[:error] = "Sorry, your message has not been sent, please try to email placestogether@gmail.com"
      render 'static/cover'
    end
  end


private

  def contact_form_params
    params.require(:contact_form).permit(:name, :email, :message)
  end

end
