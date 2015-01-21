class Review < ActiveRecord::Base
  belongs_to :participation, -> {is_confirmed}
  belongs_to :reviewee, class_name: 'User'
  belongs_to :author, class_name: 'User'
end
