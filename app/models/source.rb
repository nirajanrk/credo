class Source < ActiveRecord::Base
  
  has_and_belongs_to_many:authors
  
  attr_accessible :citation, :description, :journal, :title, :type, :url, :year
end
