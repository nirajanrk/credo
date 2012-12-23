class Point < ActiveRecord::Base
  has_and_belongs_to_many :sources
  has_and_belongs_to_many :debates
  attr_accessible :title
  validates :title, presence: true, uniqueness: true
end
