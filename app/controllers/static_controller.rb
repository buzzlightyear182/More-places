class StaticController < ApplicationController

  def home
    @contact = ContactForm.new
    render 'static/cover'
  end

end
