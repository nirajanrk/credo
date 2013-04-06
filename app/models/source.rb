class Source < ActiveRecord::Base
  has_and_belongs_to_many :authors
  accepts_nested_attributes_for :authors, :allow_destroy => true
  attr_accessible :citation_count, :description, :journal, :title, :type, :url, :year,:authors_attributes
  

  validates :title, presence: true, uniqueness: true
  validates :citation_count, numericality: true, allow_nil: true
end
