require "rails_helper"

RSpec.describe SendConfirmation, :type => :mailer do

  before :each do
    ActionMailer::Base.delivery_method = :test
    ActionMailer::Base.perform_deliveries = true
    ActionMailer::Base.deliveries = []
  end

  after :each do
    ActionMailer::Base.deliveries.clear
  end

  describe "When someone wants to join a trip, it" do

    before :each do
      @trip = create(:trip)
      @participant = create(:user, username: 'participant')
      @participation = Participation.create(user_id: @participant.id, trip_id: @trip.id, confirmed?: false)

      SendConfirmation.to_notify_organizer(@participation).deliver
    end

    it 'should send an email to the organizer' do
      expect(ActionMailer::Base.deliveries.count).to eq(1)
    end

    it 'renders the receiver email' do
      expect(ActionMailer::Base.deliveries.first.to).to eq([@participation.trip.organizer.email])
    end

    it 'should set the subject to the correct subject' do
      expect(ActionMailer::Base.deliveries.first.subject).to eq("Someone wants to join you in #{@participation.trip.destination_name}")
    end

    it 'renders the sender email' do
      expect(ActionMailer::Base.deliveries.first.from).to eq(["more-places@heroku.com"])
    end
  end

  describe "When the trip organizer adds you to the trip, it" do

    before(:each) do
      @trip = create(:trip)
      @participant = create(:user, username: 'participant')
      @participation = Participation.create(user_id: @participant.id, trip_id: @trip.id, confirmed?: false)

      SendConfirmation.to_notify_participant(@participation).deliver
    end

    it 'should send an email to the participant' do
      expect(ActionMailer::Base.deliveries.count).to eq(1)
    end

    it 'renders the receiver email' do
      expect(ActionMailer::Base.deliveries.first.to).to eq([@participation.user.email])
    end

    it 'should set the subject to the correct subject' do
      expect(ActionMailer::Base.deliveries.first.subject).to eq("#{@participation.trip.organizer.username} just added you for a trip to #{@participation.trip.destination_name}")
    end

    it 'renders the sender email' do
      expect(ActionMailer::Base.deliveries.first.from).to eq(["more-places@heroku.com"])
    end

  end
end
