class Source < ActiveRecord::Base

  has_and_belongs_to_many :authors
  accepts_nested_attributes_for :authors, :allow_destroy => true, :reject_if => lambda { |attributes| attributes['first_name'].blank? || attributes['last_name'].blank? }

  attr_accessible :citation, :description, :journal, :title, :type, :url, :year
  attr_accessible :authors_attributes
end
