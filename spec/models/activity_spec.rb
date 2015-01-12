require 'rails_helper'

RSpec.describe Activity, :type => :model do

  before :each do
    Activity.destroy_all
    @activity = create(:activity)
  end

  describe "will only be created" do

    it "if no record exists" do
      new_activity = create(:activity, name: "Trek", category: "Outdoors")
      trip = create(:trip, activity: new_activity)
      expect(Activity.count).to eq(2)
    end

  end

  describe "will not be created" do

    it "if record exists" do
      trip = create(:trip, activity: @activity)
      expect(Activity.count).to eq(1)
    end

  end

end
