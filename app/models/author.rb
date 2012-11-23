class Author < ActiveRecord::Base
	

	has_and_belongs_to_many :sources

	validates_presence_of :firstname
  attr_accessible :firstname, :lastname, :middlename, :authors_attributes
end
