class StaticController < ApplicationController

  before_action :set_contact, only: [:home, :contact]

  def home
    render 'static/cover'
  end

  def about
    render 'static/about'
  end

  def how_it_works
    render 'static/how_it_works'
  end

  def contact
    render 'static/contact'
  end

  private

  def set_contact
    @contact = ContactForm.new
  end

end
