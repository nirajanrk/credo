class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :email, :password, :password_confirmation, :remember_me, :name, :confirmed_at

  validates_presence_of :name
  validates_uniqueness_of :name, :email, :case_sensitive => false
  acts_as_voter
end
