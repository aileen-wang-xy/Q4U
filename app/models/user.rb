class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts
  has_many :creator_deal, class_name: 'Deal', foreign_key: 'creator_id'
  has_many :collector_deal, class_name: 'Deal', foreign_key: 'collector_id'
  validates :email, presence: true, uniqueness: true
  # validates :name, presence: true
end
