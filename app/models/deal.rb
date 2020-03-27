class Deal < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  belongs_to :collector, class_name: 'User'
  belongs_to :post
end
