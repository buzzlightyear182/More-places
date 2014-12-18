require 'rails_helper'

RSpec.describe Experience, :type => :model do

  describe "should be valid when it" do

    it "has all complete details" do
      experience = build(:experience)
      expect(experience).to be_valid
    end

    it "belongs to a user" do
      @user = create(:user)
      result = create(:experience, user: @user)
      expect(@user.experiences.first).to eq(result)
    end

  end

  describe "should not be valid when it" do

    it "doesn't have a destination" do
      experience = build(:experience, destination: nil)
      expect(experience).to be_invalid
    end

  end

end
