class Deal < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  belongs_to :collector, class_name: 'User'
  belongs_to :post
  
  # validate :collector_id_is_valid, on: :create

  # def collector_id_is_valid
  #   errors.add(:collector, 'You can not collect the request which is created by yourself') if (creator == collector)
  # end

end
