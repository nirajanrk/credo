class Point < ActiveRecord::Base
  has_and_belongs_to_many :sources

  has_many :debates, through: :debates_points
  has_many :debates_points
  attr_accessible :title
  validates :title, presence: true, uniqueness: true
end
