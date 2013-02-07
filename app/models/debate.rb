class Debate < ActiveRecord::Base
  has_many :points, through: :points
  has_many :points
  attr_accessible :title, :summary
  validates :title, uniqueness: true, presence: true
  validates :summary, presence: true
end
