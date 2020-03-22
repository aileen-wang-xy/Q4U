class Post < ApplicationRecord
  belongs_to :user

    validate :start_time_is_valid
    validate :end_time_is_valid

    def start_time_is_valid
      errors.add(:start_time, ': has already passed') if (start_time.past?)
    end
  
    def end_time_is_valid
      errors.add(:end_time, ': End time should be later than start time') if (end_time < start_time)
    end


end
