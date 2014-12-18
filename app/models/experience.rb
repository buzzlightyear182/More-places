class Experience < ActiveRecord::Base
  belongs_to :user
  belongs_to :destination
  belongs_to :activity

  validates :user, presence: true
  validates :destination, presence: true
  validates :from_date, presence: true
  validates :to_date, presence: true
  validates :description, presence: true
  validates :capacity, numericality: { only_integer: true, greater_than_or_equal_to: 1 }, allow_blank: true

  validate :from_date_is_in_future
  validate :from_date_before_to_date

  def from_date_is_in_future
    if Date.today > from_date
      errors.add(:from_date, "should be in the future")
    end
  end

  def from_date_before_to_date
    if from_date > to_date
      errors.add(:to_date, "should be after its beginning")
    end
  end

  def name
    "Trip ID #{id}: #{activity.name} going to #{destination.name}"
  end

  def destination_name
    destination.try(:name)
  end

  def destination_name=(name)
    self.destination = Destination.find_or_create_by(name: name) if name.present?
  end

  def activity_name
    activity.try(:name)
  end

  def activity_name=(name)
    self.activity = Activity.find_or_create_by(name: name) if name.present?
  end

end
