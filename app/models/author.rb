class Author < ActiveRecord::Base
	

	has_and_belongs_to_many :sources

  attr_accessible :firstname, :lastname, :middlename
end
