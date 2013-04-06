class Author < ActiveRecord::Base
  has_and_belongs_to_many :sources
  accepts_nested_attributes_for :sources
  validates_presence_of :first_name
  validates_presence_of :last_name
  attr_accessible :first_name, :last_name, :middle_name
end
 	