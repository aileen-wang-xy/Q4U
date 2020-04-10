class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_one :deal

  validates :service_type, presence: true
  validates :spot_name, presence: true
  validates :address, presence: true
  validates :fee, presence: true
  validates :description, presence: true
  validates :contact_name, presence: true
  validates :contactno, presence: true
  validates :contact_email, presence: true

  validate :start_time_is_valid
  validate :end_time_is_valid

  def start_time_is_valid
    errors.add(:start_time, ': has already passed') if (start_time.nil? || start_time.past?)
  end

  def end_time_is_valid
    errors.add(:end_time, ': End time should be later than start time') if (start_time.nil? || end_time.nil? || end_time < start_time)
  end

end


