class Source < ActiveRecord::Base
  
  has_and_belongs_to_many:authors
   accepts_nested_attributes_for :authors, :allow_destroy => true
   
  attr_accessible :citation, :description, :journal, :title, :type, :url, :year
end
