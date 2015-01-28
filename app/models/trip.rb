class Trip < ActiveRecord::Base
  belongs_to :organizer, foreign_key: :user_id, class_name: 'User'
  belongs_to :destination
  belongs_to :activity
  has_many :participations
  has_many :participants, through: :participations, source: :user, dependent: :destroy

  has_many :reviews, through: :participations

  has_many :pending_participations, -> {is_pending}, :class_name => 'Participation'
  # has_many :pending_participants, through: :pending_participations, source: :user

  has_many :confirmed_participations, -> {is_confirmed}, :class_name => 'Participation'
  # has_many :confirmed_participants, through: :confirmed_participations, source: :user

  scope :finished, -> { where('to_date < ?', Date.today) }
  scope :upcoming, -> { where('from_date > ?', Date.today) }
  scope :ongoing, -> { where('to_date >= ?', Date.today).where('from_date <= ?', Date.today)}

  validates :organizer, presence: true
  validates :destination, presence: true
  validates :activity, presence: true
  validates :from_date, presence: true
  validates :to_date, presence: true
  validates :description, presence: true
  validates :capacity, numericality: { only_integer: true, greater_than_or_equal_to: 1 }, allow_blank: true

  validate :check_dates

  after_create :create_participation

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

  def google_places_id
    destination.google_places_id.try(:google_places_id)
  end


  def google_places_id=(google_places_id)
    self.destination.update_attributes(google_places_id: google_places_id)
  end

  def activity_name
    activity.try(:name)
  end

  def activity_name=(name)
    self.activity = Activity.create_with(category: "Others").find_or_create_by(name: name) if name.present?
  end

  def joinable_by? user
    if self.participants.include? user
      return false
    else
      return true if self.capacity.nil?
      self.has_open_slots && self.has_not_passed
    end
  end

  def owner_is? user
    self.organizer == user
  end

  def has_open_slots
    (self.capacity - self.participations.count) > 0
  end

  def has_not_passed
    self.from_date > Date.today
  end

  def has_finished?
    self.to_date < Date.today
  end

  def is_ongoing?
    (self.to_date >= Date.today) && (self.from_date <= Date.today)
  end

  # Trip UPCOMING --> APPROVE pending participants
  # Trip ONGOING --> LIST only confirmed participants
  # Trip FINISHED --> REVIEW only confirmed participants

  private

  def create_participation
    Participation.create!(trip_id: self.id, user_id: self.organizer.id, confirmed?: true)
  end

end
