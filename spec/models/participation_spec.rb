require 'rails_helper'

RSpec.describe Participation, :type => :model do

  it { should belong_to(:trip) }
  it { should belong_to(:user) }

end
