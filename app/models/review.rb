class Review < ApplicationRecord
  belongs_to :reviewer, class_name: 'User'
  belongs_to :be_reviewed, class_name: 'User'
  belongs_to :deal
end
