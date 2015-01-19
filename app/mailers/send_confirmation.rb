class SendConfirmation < ActionMailer::Base
  # mandrill = Mandrill::API.new(ENV['MANDRILL_APIKEY'] || 'gjXW9zjyNAJqUKmM2XVCYQ')
  default from: "more-places@heroku.com"
  # default from: "app28633921@heroku.com"

  def to_notify_organizer participation
    @trip = participation.trip
    @participant = @trip.organizer

    @link = confirm_participant(participation)

    mail(to: @participant.email, subject: "Someone wants to join you in #{@trip.destination_name}")
  end

  def to_notify_participant participation
    @trip = participation.trip
    @participant = participation.user

    @link = show_link_for @trip

    mail(to: @participant.email, subject: "#{@trip.organizer.username} just added you for a trip to #{@trip.destination_name}")
  end

  private

  def confirm_participant participation
    "http://localhost:3000/confirm_participant/#{participation.id}"
  end

  def show_link_for trip
    "http://localhost:3000/trips/#{trip.id}"
  end
end
