class Review < ActiveRecord::Base
  belongs_to :participation, -> {is_confirmed}
  belongs_to :author, class_name: 'User'

  validates :content, presence: true
  validates :score, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1 }

end
