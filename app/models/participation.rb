class Participation < ActiveRecord::Base
  belongs_to :user
  belongs_to :trip
  has_many :reviews

  scope :is_confirmed, -> {where(confirmed?: true)}
  scope :is_pending, -> {where(confirmed?: false)}

  validates :user, presence: true
  validates :trip, presence: true
  validates :confirmed?, inclusion: { in: [true, false] }
  validates_associated :trip

end
