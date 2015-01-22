require 'rails_helper'

RSpec.describe Review, :type => :model do

  it { should belong_to(:participation) }
  it { should belong_to(:author) }

end
