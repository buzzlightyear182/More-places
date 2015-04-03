class Destination < ActiveRecord::Base
  has_many :trips

  def name
    self.city + "," + self.country
  end
end
