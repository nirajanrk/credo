class Source < ActiveRecord::Base
  
  has_many_belongs_to :authors
  
  attr_accessible :citation, :description, :journal, :title, :type, :url, :year
end
