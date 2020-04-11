class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :timeoutable
  has_many :posts
  has_many :creator_deal, class_name: 'Deal', foreign_key: 'creator_id'
  has_many :collector_deal, class_name: 'Deal', foreign_key: 'collector_id'

  has_many :reviewer_review, class_name: 'Review', foreign_key: 'reviewer_id'
  has_many :be_reviewed_review, class_name: 'Review', foreign_key: 'be_reviewed_id'

  validates :email, presence: true, uniqueness: true
  validates :name, presence: true, uniqueness: true

end