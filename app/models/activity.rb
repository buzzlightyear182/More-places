class Activity < ActiveRecord::Base
  has_many :trips

  def activity_with_category
    "#{category} - #{name}"
  end

  def self.categories
    activities = Activity.all.order(:category)
    @categories = activities.map(&:category).uniq!
  end

end
