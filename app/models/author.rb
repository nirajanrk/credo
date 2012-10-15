class Author < ActiveRecord::Base
	
	has_many :sources

  attr_accessible :firstname, :lastname, :middlename
end
