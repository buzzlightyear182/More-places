class Review < ActiveRecord::Base
  belongs_to :participation, -> {is_confirmed}
  belongs_to :author, class_name: 'User'

end
