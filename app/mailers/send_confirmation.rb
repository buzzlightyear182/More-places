class SendConfirmation < ActionMailer::Base
  # mandrill = Mandrill::API.new(ENV['MANDRILL_APIKEY'] || 'gjXW9zjyNAJqUKmM2XVCYQ')
  default from: "admin@placestogether.com"
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
    "http://www.placestogether.com/confirm_participant/#{participation.id}"
  end

  def show_link_for trip
    "http://www.placestogether.com/trips/#{trip.id}"
  end
end
