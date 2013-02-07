class Evidence < ActiveRecord::Base
  has_and_belongs_to_many :sources

  has_many :debates, through: :points
  has_many :points
  attr_accessible :title, :source_ids
  validates :title, presence: true, uniqueness: true
end
