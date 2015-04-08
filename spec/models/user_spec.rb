require 'rails_helper'

RSpec.describe User, :type => :model do
    it { should have_many(:trips) }
    it { should have_one(:profile) }

  let (:user) { create(:user) }

  describe "when a user is created" do

    it "profile should be automatically generated" do
      expect(user.profile.id).to eq(user.id)
    end
  end

end
