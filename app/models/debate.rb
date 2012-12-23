class Debate < ActiveRecord::Base
  has_and_belongs_to_many :points
  attr_accessible :title
  validates :title, uniqueness: true, presence: true
end
