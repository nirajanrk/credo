class Debate < ActiveRecord::Base
  has_many :points, through: :debates_points
  has_many :debates_points
  attr_accessible :title, :summary
  validates :title, uniqueness: true, presence: true
  validates :summary, presence: true
end
