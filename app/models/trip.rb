class Trip < ActiveRecord::Base
  belongs_to :user
  belongs_to :destination
  belongs_to :activity
  has_many :participations, dependent: :destroy
  has_many :participants, through: :participations, source: :user

  validates :user, presence: true
  validates :destination, presence: true
  validates :activity, presence: true
  validates :from_date, presence: true
  validates :to_date, presence: true
  validates :description, presence: true
  validates :capacity, numericality: { only_integer: true, greater_than_or_equal_to: 1 }, allow_blank: true

  validate :check_dates

  def check_dates
    if from_date.nil?
      return
    else
      from_date_is_in_future
      from_date_before_to_date
    end
  end

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
    destination_array = name.split(',')
    self.destination = Destination.find_or_create_by(city: destination_array.first, country: destination_array.last) if name.present?
  end

  def activity_name
    activity.try(:name)
  end

  def activity_name=(name)
    self.activity = Activity.create_with(category: "Others").find_or_create_by(name: name) if name.present?
  end

  def confirmed_participants
    self.participations.where(confirmed: true)
  end

  def pending_participants
    self.participations.where(confirmed: false)
  end

end
