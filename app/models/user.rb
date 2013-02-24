class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :email, :password, :password_confirmation, :remember_me, :name, :confirmed_at, :points_attributes

  validates :name, presence: true
  validates :email, presence: true
  validates_uniqueness_of :email, :case_sensitive => false
  acts_as_voter
end
