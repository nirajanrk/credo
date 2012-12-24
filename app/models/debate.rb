class Debate < ActiveRecord::Base
  has_many :points, through: :debates_points
  has_many :debates_points
  attr_accessible :title
  validates :title, uniqueness: true, presence: true
end
